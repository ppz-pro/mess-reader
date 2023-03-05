const config = require('.')

module.exports = {
  ...config,
  
  mode: 'development',
  devtool: 'inline-source-map',
  devServer: {
    static: './dist',
  },
}