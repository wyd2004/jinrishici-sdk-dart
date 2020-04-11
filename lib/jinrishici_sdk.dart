library jinrishici_sdk;
import 'package:http/http.dart' as http;
import 'package:jinrishici_sdk/info.dart';
import 'package:jinrishici_sdk/sentence.dart';
import 'token.dart';
import 'sentence.dart';

class JinrishiciClient {
  final _baseURL = "https://v2.jinrishici.com/";
  final _tokenPath = "token"; //获取token
  final _sentencePath = "sentence"; //获取sentence
  final _infoPath = "info";  //获取info

  var token = "";

  //get token
  Future<Token> getToken() async {
    var response = await http.get(_baseURL + _tokenPath);
    
    if (response.statusCode == 200) {
      final tokenObj = tokenFromJson(response.body);
      if (tokenObj.status == "success") {
        return tokenObj;
      } else {
        throw("Token request error.");
      }
    } else {
      //return Future.error("Token get error.", StackTrace.fromString("/token"));
      throw("Token get error.");
    }
  }

  //get sentence
  Future<Sentence> getSentence() async {
    if (this.token.length == 0) {
      var tokenObj = await getToken();
      this.token = tokenObj.data;
    }
    var headers = {
      "X-User-Token": this.token
    };
    var response = await http.get(_baseURL + _sentencePath, headers: headers);
    final sentence = sentenceFromJson(response.body);
    if (response.statusCode == 200) {
      if (sentence.status == "success") {
        return sentence;
      } else {
        throw("Sentence request error");
      }
    } else {
//      return Future.error("Sentence get error.", StackTrace.fromString("/sentence"));
        throw("Sentence get error.");
    }
  }
  //get info
  Future<Info> getInfo() async {
    if (this.token.length == 0) {
      var tokenObj = await getToken();
      this.token = tokenObj.data;
    }
    var headers = {
      "X-User-Token": this.token
    };
    var response = await http.get(_baseURL + _infoPath, headers: headers);
    if (response.statusCode == 200) {
      final info = infoFromJson(response.body);
      if (info.status == "success") {
        return info;
      } else {
        throw("Info request error");
      }
    } else {
        throw("Sentence get error.");
    }
  }
}
