HtmlWebpackPlugin = require 'html-webpack-plugin'
UglifyJSPlugin = require('uglifyjs-webpack-plugin')
HtmlWebpackExternalsPlugin = require('html-webpack-externals-plugin')
ExtractTextPlugin = require('extract-text-webpack-plugin')
poststylus = require 'poststylus'
_ = require 'lodash'
webpack = require 'webpack'
path = require 'path'
CSON = require 'cson'
manifest = CSON.load './src/manifest.cson'

{ htmlConfig, externalsConfig, postCssConfig } = manifest

isProd = process.env.NODE_ENV is 'production'
isDev = not isProd

parsePlug = (plug)->
  if typeof plug is 'string'
    [require(plug)()]
  else if typeof plug is 'object'
    for key, value of plug
      [require(key)(value)]

postCssConfig = _.flattenDeep(
  for key, value of postCssConfig
    switch key
      when 'dev'
        if isDev
          for plug in value
            parsePlug(plug)
        else
          []
      when 'prod'
        if isProd
          for plug in value
            parsePlug(plug)
        else
          []
      else
        for plug in value
          parsePlug(plug)
)

console.log 'postCssConfig = ', JSON.stringify(postCssConfig)

module.exports =
  entry: './src/index.coffee'
  output:
    path: path.resolve(__dirname, 'bin')
    filename: 'bundle.js'
  devtool: if isDev
    'inline-source-map'
  else
    undefined
  devServer:
    contentBase: path.join(__dirname, 'bin')
    port: 3000
  module: rules: [
    {
      test: /\.(gif|png|jpe?g|svg)$/i
      use: [
        {
          loader: 'file-loader'
          options:
            name: ->
              if isDev
                '[path][name].[ext]'
              else
                '[hash].[ext]'

        }
        {
          loader: 'image-webpack-loader'
          # options:
          #   bypassOnDebug: true
        }
      ]
    }
    {
      test: /\.styl$/
      use:
        ExtractTextPlugin.extract
          fallback:
            {
              loader: 'style-loader'
              options:
                sourceMap: isDev
            }
          use: [
            {
              loader: 'css-loader'
              options:
                sourceMap: isDev
                minimize: isProd
                importLoaders: 1
            }
            {
              loader: 'postcss-loader'
              options:
                sourceMap: isDev
                plugins:
                  postCssConfig
            }
            {
              loader: 'stylus-loader'
              options:
                sourceMap: isDev
            }
          ]
    }
    {
      test: /\.(woff|woff2|eot|ttf|otf)$/,
      loader: 'file-loader'
      options:
        name: ->
          if isDev
            '[path][name].[ext]'
          else
            '[hash].[ext]'
    }
    {
      test: /\.cson$/
      loader: 'cson-loader'
    }
    {
      test: /\.(coffee)$/
      use:[
        loader: 'coffee-loader'
        options:
          transpile:
            presets: ['env']
      ]
    }
  ]
  resolve:
    extensions: [
      '.js', '.json'
      '.coffee', '.cson'
      '.styl'
    ]
    modules: [
      'src'
      'node_modules'
    ]
  plugins: [
    if isDev
      new webpack.HotModuleReplacementPlugin()
    else
      new UglifyJSPlugin()
    new webpack.NoEmitOnErrorsPlugin()
    new HtmlWebpackPlugin htmlConfig
    new HtmlWebpackExternalsPlugin externalsConfig
    new ExtractTextPlugin 'styles.css'
  ]
