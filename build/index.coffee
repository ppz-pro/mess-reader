FS = require 'fs'
Path = require 'path'

# plugins
Plugin_coffee = require 'esbuild-coffeescript'
{ stylusLoader: Plugin_styl } = require 'esbuild-stylus-loader'
Plugin_alias = require 'esbuild-plugin-path-alias'

# 向编译好的 js 里插额外代码
banner = require './banner/index.coffee'

# 绝对路径
abs_path = (relative_path) -> Path.resolve process.cwd(), relative_path

try
  FS.mkdirSync('dist')
catch err
  console.debug 'info: 文件夹 dist 未创建'
  # console.error err

FS.cpSync('src/public', 'dist', {
  recursive: true
})

module.exports = {
  entryPoints: ['src/index.coffee']
  bundle: true
  sourcemap: true
  treeShaking: true
  minify: true
  outdir: 'dist'
  logLevel: 'info'
  banner
  loader:
    '.woff2': 'file'
  plugins: [
    Plugin_coffee()
    Plugin_alias {
      '#svice': abs_path 'src/ssu/svice'
      '#constant': abs_path 'src/constant'
    }
    Plugin_styl {
      stylusOptions:
        include: [
          abs_path 'src/style'
        ]
    }
  ]
}
