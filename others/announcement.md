#### ETHASH-2.0.0版本已发布，此次版本为大版本更新，强烈建议更新。
----
#### 当前版本：{BUILD_VERSION}({BUILD_DATE})
#### 最新版本：[V2.0.0_ETHASH(2022-05-05)](https://github.com/XMinerProxy/XMinerProxy/releases/tag/2.0.0) - [[历史更新日志]](https://github.com/XMinerProxy/XMinerProxy/releases)
#### 联系我们：[Telegram讨论群组（欢迎向我们提出建议）](https://t.me/XMinerProxy)、[GitHub](https://github.com/XMinerProxy/XMinerProxy)
#### V2.0.0更新内容：
- 更新精准抽水算法(降低NiceHash协议抽水损耗，适配跨矿池抽水和动态难度)
- 针对矿池链接稳定性进行独家优化，降低因服务器网络波动导致的损耗
- 针对大量矿机的高并发环境进行优化
- 大幅优化CPU和内存占用情况
- 优化网络带宽使用
- 修复前置代理模式的代理池初始化timeout问题
- 修复数个BUG和1.2.0新发现的BUG
#### 注意：
- 抽水实到1G以上建议不要抽水到F2pool，由于F2pool为动态难度会把难度提升到32G以上，导致批量上线的矿机突发抽水，只能保证24小时平均算力正确
- 由于协议差异, 目前无法实现跨协议抽水, 所以如果设置CrazyPool为归集目标的话需要客户端均使用NiceHash/Stratum2协议
----
#### 掉线原因参考表：
- EOF: 客户端主动发出的下线请求
- i/o timeout: 长时间未收到客户端的提交
- reset bt peer: TCP连接被重置，可能是线路波动丢包或阻断