# mess-reader
一个 epub 阅读器，快[试试看](https://ppz-pro.github.io/mess-reader/)

+ 可安装
+ 安装后，可通过双击 .epub 文件打开（就像双击 .doc 文件打开 word）
+ [分享线上电子书](./doc/share.md)

## 开发
``` bash
# 克隆仓库
git clone https://github.com/ppz-pro/mess-reader.git
# 进入项目目录
cd mess-reader
# 安装依赖
npm install
# 开发模式
npm run dev
```

##### 库们
+ [esbuild](https://esbuild.github.io/) 打包
+ [react](https://react.dev/) ui
+ [stylus](https://stylus-lang.com/) 样式
+ [epubjs](https://github.com/futurepress/epub.js/) 解析、展示 epub 文件，[demo](http://futurepress.github.io/epub.js/examples/spreads.html)

##### pwa
+ [最小 manifest](https://learn.microsoft.com/en-us/microsoft-edge/progressive-web-apps-chromium/how-to/web-app-manifests#manifest-members)
+ [注册 service worker](https://learn.microsoft.com/en-us/microsoft-edge/progressive-web-apps-chromium/how-to/#step-5---add-a-service-worker)
+ [关联文件](https://learn.microsoft.com/en-us/microsoft-edge/progressive-web-apps-chromium/how-to/handle-files)
+ [manifest MDN](https://developer.mozilla.org/en-US/docs/Web/Manifest)

##### 其他
+ [CoffeeScript](https://coffeescript.org/)
+ [图标](https://favicon.io/favicon-generator/)

## 缘起
刚才看完[电影](https://movie.douban.com/subject/1292450/)在豆瓣上瞎看，就看到[一个感兴趣的小说](https://book.douban.com/subject/35556905/)。搜索、下载之后，是一个 epub 文件。怎么打开呢？记得有个叫 [neat reader](https://www.neat-reader.cn/) 的软件，我用过一次，说实话，真的很不 neat。

于是我就想能不能自己写个 app 来阅读 epub 电子书。我随手一搜还真有叫 [epub.js](https://github.com/futurepress/epub.js/) 的库。于是我在知乎上提了[这个问题](https://www.zhihu.com/question/586397967)。

但是我还没描述完我的问题，就想到能不能用 pwa 来实现，竟然也可以，说是 pwa 支持“注册打开某种类型的文件”。于是就有了这个代码仓库。
