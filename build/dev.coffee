{ context } = require 'esbuild'
options = require './index.coffee'
dev_reload = require './banner/dev_reload.coffee'

do ->
  options.banner.js += dev_reload
  
  ctx = await context options

  # 监听文件变化
  await ctx.watch()

  # 开发服务器
  await ctx.serve {
    servedir: 'dist'
  }
