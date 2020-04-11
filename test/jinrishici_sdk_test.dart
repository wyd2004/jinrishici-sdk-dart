import 'package:flutter_test/flutter_test.dart';

import 'package:jinrishici_sdk/jinrishici_sdk.dart';

void main() {
  test('get sentence', () async {
    JinrishiciClient client = JinrishiciClient();
    var sentence = await client.getSentence();
    print(sentence.data.toJson());
  });
  test('get info', () async {
    final client = JinrishiciClient();
    var info = await client.getInfo();
    print(info.data.toJson());
  });
  test('get token', () async {
    final client = JinrishiciClient();
    var token = await client.getToken();
    print(token.data);
  });
}
