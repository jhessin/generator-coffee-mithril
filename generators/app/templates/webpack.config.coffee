HtmlWebpackPlugin = require 'html-webpack-plugin'
webpack = require 'webpack'
path = require 'path'

module.exports =
  entry: './src/index.coffee'
  output:
    path: path.resolve(__dirname, 'bin')
    filename: 'bundle.js'
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
      test: /\.(sass|scss|css)$/
      use:[
        { loader: 'style-loader' }
        { loader: 'css-loader' }
        { loader: 'sass-loader' }
      ]
    }
    {
      test: /\.(woff|woff2|eot|ttf|otf)$/,
      loader: 'file-loader'
    }
    {
      test: /\.(coffee|cson)$/
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
      '.coffee', '.cson', '.sass', '.scss'
    ]
  plugins: [
    new HtmlWebpackPlugin()
  ]
