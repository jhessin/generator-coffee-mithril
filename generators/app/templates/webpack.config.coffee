HtmlWebpackPlugin = require 'html-webpack-plugin'
webpack = require 'webpack'
path = require 'path'

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
      ]
    }
    {
      test: /\.styl$/
      loader:
        'style-loader!\
        css-loader!\
        stylus-loader?\
        paths=node_modules/bootstrap-stylus/stylus/'
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
    new HtmlWebpackPlugin()
  ]
