HtmlWebpackPlugin = require 'html-webpack-plugin'
HtmlWebpackExternalsPlugin = require('html-webpack-externals-plugin')
webpack = require 'webpack'
path = require 'path'
CSON = require 'cson'
manifest = CSON.load './src/manifest.cson'

{ htmlConfig, externals } = manifest

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
        'file-loader'
        loader: 'image-webpack-loader'
        options:
          bypassOnDebug: true
      ]
    }
    {
      test: /\.css$/
      use: [
        'style-loader'
        {
          loader: 'css-loader'
          options:
            modules: true
        }
        {
          loader: 'postcss-loader'
          options:
            sourceMap: 'inline'
        }
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
            importLoaders: 1
        }
        {
          loader: 'postcss-loader'
          options:
            sourceMap: 'inline'
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
    new HtmlWebpackExternalsPlugin {externals}
  ]
