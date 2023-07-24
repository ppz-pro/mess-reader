FS = require 'fs'

Plugin_coffee = require 'esbuild-coffeescript'
{ stylusLoader: Plugin_styl } = require 'esbuild-stylus-loader'

try
  FS.mkdirSync('dist')
catch err
  console.debug 'info: 文件夹 dist 未创建'
  # console.error err

FS.copyFileSync('src/index.html', 'dist/index.html')

module.exports = {
  entryPoints: ['src/index.coffee']
  bundle: true
  sourcemap: true
  treeShaking: true
  minify: true
  outdir: 'dist'
  logLevel: 'info'
  plugins: [
    Plugin_coffee()
    Plugin_styl()
  ]
}
