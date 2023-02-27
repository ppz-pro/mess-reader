const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports = {
  entry: './src/index.coffee',
  output: {
    filename: 'main.js',
    clean: true,
    path: path.resolve(__dirname, '../dist')
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: path.resolve(__dirname, '../src/index.html'),
      filename: path.resolve(__dirname, '../dist/index.html')
    }),
  ],
  module: {
    rules: [
      {
        test: /\.coffee$/,
        use: [
          'coffee-loader'
        ]
      },
      {
        test: /\.styl$/,
        use: ['style-loader', 'css-loader', 'stylus-loader']
      },
      // {
      //   test: /\.(png|svg|jpg|jpeg|gif)$/i,
      //   type: 'asset/resource'
      // }
    ]
  }
}