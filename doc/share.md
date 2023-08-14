# 分享线上 epub 电子书
如果一个 epub 文件可以下载，如 [这个 https://s3.amazonaws.com/moby-dick/moby-dick.epub](https://s3.amazonaws.com/moby-dick/moby-dick.epub)

那么经过简单的拼接：  
`https://ppz-pro.github.io/mess-reader/?t=` + `下载链接`  
那么别人就可以直接打开你的电子书

试一下这个链接：  
[https://ppz-pro.github.io/mess-reader/?t=https%3A%2F%2Fs3.amazonaws.com%2Fmoby-dick%2Fmoby-dick.epub](https://ppz-pro.github.io/mess-reader/?t=https%3A%2F%2Fs3.amazonaws.com%2Fmoby-dick%2Fmoby-dick.epub)

**注意！** 下载链接需要 encodeURIComponent：
+ 如果你只想手动分享少部分 epub 电子书，可以使用[这个网站](https://www.urlencoder.io/)
+ 如果你想在你的网站或 app 里分享
  + 如果你使用 javascript，可以直接使用 [`encodeURIComponent()` 函数](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent)
  + 如果你使用其他编程语言，可以用搜索引擎查一下：`编程语言 + encodeURIComponent`，如 [`python encodeURIComponent`](https://www.bing.com/search?q=python+encodeURIComponent)
