HtmlWebpackPlugin = require 'html-webpack-plugin'
HtmlWebpackExternalsPlugin = require('html-webpack-externals-plugin')
ExtractTextPlugin = require('extract-text-webpack-plugin')
webpack = require 'webpack'
path = require 'path'
CSON = require 'cson'
manifest = CSON.load './src/manifest.cson'

{ htmlConfig, externalsConfig } = manifest

module.exports =
  entry: './src/index.coffee'
  output:
    path: path.resolve(__dirname, 'bin')
    filename: 'bundle.js'
  devtool: 'inline-source-map'
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
              if process.env.NODE_ENV is 'development'
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
                sourceMap: true
            }
          use: [
            {
              loader: 'css-loader'
              options:
                sourceMap: true
                importLoaders: 1
            }
            {
              loader: 'postcss-loader'
              options:
                sourceMap: true
            }
            {
              loader: 'stylus-loader'
              options:
                sourceMap: true
                paths:'node_modules/bootstrap-stylus/stylus/'
            }
          ]
    }
    {
      test: /\.(woff|woff2|eot|ttf|otf)$/,
      loader: 'file-loader'
      options:
        name: ->
          if process.env.NODE_ENV is 'development'
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
      '.styl', '.css'
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
    new ExtractTextPlugin 'styles.css'
  ]
