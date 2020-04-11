// To parse this JSON data, do
//
//     final sentence = sentenceFromJson(jsonString);
import 'dart:convert';

Sentence sentenceFromJson(String str) => Sentence.fromJson(json.decode(str));

String sentenceToJson(Sentence data) => json.encode(data.toJson());

class Sentence {
  String status;
  Data data;
  String token;
  String ipAddress;
  dynamic warning;

  Sentence({
    this.status,
    this.data,
    this.token,
    this.ipAddress,
    this.warning,
  });

  factory Sentence.fromJson(Map<String, dynamic> json) => Sentence(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    token: json["token"],
    ipAddress: json["ipAddress"],
    warning: json["warning"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "token": token,
    "ipAddress": ipAddress,
    "warning": warning,
  };
}

class Data {
  String id;
  String content;
  int popularity;
  Origin origin;
  List<String> matchTags;
  String recommendedReason;
  DateTime cacheAt;

  Data({
    this.id,
    this.content,
    this.popularity,
    this.origin,
    this.matchTags,
    this.recommendedReason,
    this.cacheAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    content: json["content"],
    popularity: json["popularity"],
    origin: Origin.fromJson(json["origin"]),
    matchTags: List<String>.from(json["matchTags"].map((x) => x)),
    recommendedReason: json["recommendedReason"],
    cacheAt: DateTime.parse(json["cacheAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "popularity": popularity,
    "origin": origin.toJson(),
    "matchTags": List<dynamic>.from(matchTags.map((x) => x)),
    "recommendedReason": recommendedReason,
    "cacheAt": cacheAt.toIso8601String(),
  };
}

class Origin {
  String title;
  String dynasty;
  String author;
  List<String> content;
  dynamic translate;

  Origin({
    this.title,
    this.dynasty,
    this.author,
    this.content,
    this.translate,
  });

  factory Origin.fromJson(Map<String, dynamic> json) => Origin(
    title: json["title"],
    dynasty: json["dynasty"],
    author: json["author"],
    content: List<String>.from(json["content"].map((x) => x)),
    translate: json["translate"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "dynasty": dynasty,
    "author": author,
    "content": List<dynamic>.from(content.map((x) => x)),
    "translate": translate,
  };
}
