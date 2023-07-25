FS = require 'fs'

Plugin_coffee = require 'esbuild-coffeescript'
{ stylusLoader: Plugin_styl } = require 'esbuild-stylus-loader'
banner = require './banner/index.coffee'

try
  FS.mkdirSync('dist')
catch err
  console.debug 'info: 文件夹 dist 未创建'
  # console.error err

FS.copyFileSync('public/index.html', 'dist/index.html')
FS.copyFileSync('public/service_worker.js', 'dist/service_worker.js')
FS.copyFileSync('public/manifest.json', 'dist/manifest.json')
FS.copyFileSync('public/icon.svg', 'dist/icon.svg')

module.exports = {
  entryPoints: ['src/index.coffee']
  bundle: true
  sourcemap: true
  treeShaking: true
  minify: true
  outdir: 'dist'
  logLevel: 'info'
  banner
  plugins: [
    Plugin_coffee()
    Plugin_styl()
  ]
}
