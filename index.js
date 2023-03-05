const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports = {
  entry: './src/app/entry/index.coffee',
  output: {
    filename: 'main.js',
    clean: true,
    path: path.resolve(__dirname, '../dist')
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: path.resolve(__dirname, '../src/app/entry/index.html'),
      filename: path.resolve(__dirname, '../dist/index.html')
    }),
  ],
  module: {
    rules: [
      {
        test: /\.coffee$/,
        use: [
          {
            loader: 'babel-loader',
            options: {
              plugins: [
                'transform-react-pug',
                'transform-react-jsx'
              ],
              presets: [
                ['@babel/preset-env'],
                ['@babel/preset-react']
              ]
            }
          },
          'coffee-loader'
        ]
      },
      {
        test: /\.styl$/,
        use: ['style-loader', 'css-loader', 'stylus-loader']
      },
      {
        // test: /\.(png|svg|jpg|jpeg|gif)$/i,
        test: /\.(epub)$/i,
        type: 'asset/resource'
      }
    ]
  }
}