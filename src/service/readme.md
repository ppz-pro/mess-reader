##### service = state + service

service 是 state 与 ui 之间的桥梁：
+ 暴露 state 的 value
+ 设置 state 的逻辑放在 service 里，尽量不直接暴露 setter

##### 分层
+ render
+ book, theme
