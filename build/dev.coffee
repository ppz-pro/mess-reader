{ context } = require 'esbuild'
plugins = [
  'esbuild-coffeescript'
].map require

do ->
  ctx = await context {
    entryPoints: ['src/index.coffee']
    bundle: true
    sourcemap: true
    outdir: 'dist'
    logLevel: 'debug'
    plugins: plugins.map (Plugin) -> Plugin()
  }

  # 监听文件变化
  await ctx.watch()

  # 开发服务器
  await ctx.serve {
    servedir: 'dist'
  }
