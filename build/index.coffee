FS = require 'fs'
plugins = [
  'esbuild-coffeescript'
].map require

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
  outdir: 'dist'
  logLevel: 'debug'
  plugins: plugins.map (Plugin) -> Plugin()
}
