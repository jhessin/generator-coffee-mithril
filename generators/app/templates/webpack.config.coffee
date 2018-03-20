HtmlWebpackPlugin = require 'html-webpack-plugin'
HtmlWebpackExternalsPlugin = require('html-webpack-externals-plugin')
webpack = require 'webpack'
path = require 'path'
CSON = require 'cson'
manifest = CSON.load './src/manifest.cson'

{
  htmlConfig
  externalsConfig
  cssLoaderConfig
} = manifest

module.exports =
  entry:
    app: './src/index.coffee'
    styles: './src/styles/index.styl'
  output:
    path: path.resolve(__dirname, 'bin')
    filename: ({name}) ->
      switch name
        when 'styles'
          'bundle.css'
        else
          '[name].js'
  devtool: 'inline-source-map'
  devServer:
    contentBase: path.join(__dirname, 'bin')
    port: 3000
  module: rules: [
    {
      test: /\.(gif|png|jpe?g|svg)$/i
      use: [
        'file-loader'
        loader: 'image-webpack-loader'
        options:
          bypassOnDebug: true
      ]
    }
    {
      test: /\.styl$/
      use:[
        {
          loader: 'style-loader'
          options:
            sourceMap: true
        }
        {
          loader: 'css-loader'
          options:
            sourceMap: true
        }
        {
          loader: 'postcss-loader'
          options:
            sourceMap: true
        }
        {
          loader: 'stylus-relative-loader'
          options:
            sourceMap: true
            preferPathResolver: 'webpack'
        }
      ]
    }
    {
      test: /\.(woff|woff2|eot|ttf|otf)$/,
      loader: 'file-loader'
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
    new webpack.HotModuleReplacementPlugin()
    new webpack.NoEmitOnErrorsPlugin()
    new HtmlWebpackPlugin htmlConfig
    new HtmlWebpackExternalsPlugin externalsConfig
  ]
