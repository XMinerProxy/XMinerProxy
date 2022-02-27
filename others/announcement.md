#### 近期发现有人使用默认密码恶意扫描程序后台，请检查自己的后台密码是否为默认弱密码。如之前为默认密码没有修改，请第一时间检查自定义矿池中是否出现非自己添加的第三方IP。
----
#### 当前版本：{BUILD_VERSION}({BUILD_DATE})
#### 最新版本：[V1.0.4_ETHASH(2022-02-26)](https://github.com/XMinerProxy/XMinerProxy/releases/tag/1.0.4) - [[历史更新日志]](https://github.com/XMinerProxy/XMinerProxy/releases)
#### 联系我们：[Telegram讨论群组（欢迎向我们提出建议）](https://t.me/XMinerProxy)、[GitHub](https://github.com/XMinerProxy/XMinerProxy)
#### V1.0.4更新内容：
- 优化1.0.2/1.0.3版本的内存占用情况
- 修复ETC内置矿池地址中2Miners亚洲节点信息配置错误的问题
- 修复ETC自定义矿池地址无法连接的问题
- 修复1.0.3无法动态修改抽水率的问题
#### 注意：由于协议差异，目前无法实现跨协议抽水，所以如果设置CrazyPool为归集目标的话需要客户端均使用NiceHash/Stratum2协议。
----
#### 掉线原因参考表：
- EOF: 客户端主动发出的下线请求
- i/o timeout: 长时间未收到客户端的提交
- reset bt peer: TCP连接被重置，可能是线路波动丢包或阻断