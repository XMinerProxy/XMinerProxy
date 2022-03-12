#### ETHASH-1.1.0版本已发布，此次版本为大版本更新，强烈推荐更新！
----
#### 当前版本：{BUILD_VERSION}({BUILD_DATE})
#### 最新版本：[V1.1.0_ETHASH(2022-03-12)](https://github.com/XMinerProxy/XMinerProxy/releases/tag/1.1.0) - [[历史更新日志]](https://github.com/XMinerProxy/XMinerProxy/releases)
#### 联系我们：[Telegram讨论群组（欢迎向我们提出建议）](https://t.me/XMinerProxy)、[GitHub](https://github.com/XMinerProxy/XMinerProxy)
#### V1.1.0更新内容：此次版本为大版本更新，强烈推荐更新！
- 对部分代码进行重构，修复1.0.5版本存在的致命性问题
- 对部分逻辑进行优化
- 对部分新款专业矿机进行兼容
- 对内存使用情况进行再次优化
- 修复部分抽水失败的情况
- 修复某个极端条件下可能引发的请求BUG
- 修复大陆服务器获取公告失败
- 优化随机抽水算法，避免大量用户上线时的抽水点过于集中
- 优化上游连接
- 优化连接与逻辑
- 优化任务下发的链接管理
- 彻底优化数据同步
- 部分提示语的详细与优化
- 丰富抽水钱包地址或登录名错误时出现的提示信息
#### 注意：由于协议差异，目前无法实现跨协议抽水，所以如果设置CrazyPool为归集目标的话需要客户端均使用NiceHash/Stratum2协议。
----
#### 掉线原因参考表：
- EOF: 客户端主动发出的下线请求
- i/o timeout: 长时间未收到客户端的提交
- reset bt peer: TCP连接被重置，可能是线路波动丢包或阻断