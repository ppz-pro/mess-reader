{ context } = require 'esbuild'
options = require './index.coffee'

do ->
  ctx = await context options

  # 监听文件变化
  await ctx.watch()

  # 开发服务器
  await ctx.serve {
    servedir: 'dist'
  }
