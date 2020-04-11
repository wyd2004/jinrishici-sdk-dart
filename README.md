# 今日诗词 Dart SDK

A new Flutter package project.

## 安装

- Todo

## 使用

```dart
//获取 sentence 对象。自动获取token
JinrishiciClient client = JinrishiciClient();
var sentence = await client.getSentence();
//测试 token
JinrishiciClient client = JinrishiciClient();
var info = await client.getInfo();
//获取 token
final client = JinrishiciClient();
var token = await client.getToken();
```

## Todo

- 增加安装方式
- 磁盘缓存token
- 自定义Flutter控件

## License

None
