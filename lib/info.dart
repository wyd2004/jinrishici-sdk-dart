// To parse this JSON data, do
//
//     final info = infoFromJson(jsonString);

import 'dart:convert';

Info infoFromJson(String str) => Info.fromJson(json.decode(str));

String infoToJson(Info data) => json.encode(data.toJson());

class Info {
    String status;
    Data data;

    Info({
        this.status,
        this.data,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    String token;
    String ip;
    String region;
    WeatherData weatherData;
    List<String> tags;
    DateTime beijingTime;

    Data({
        this.token,
        this.ip,
        this.region,
        this.weatherData,
        this.tags,
        this.beijingTime,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        ip: json["ip"],
        region: json["region"],
        weatherData: WeatherData.fromJson(json["weatherData"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
        beijingTime: DateTime.parse(json["beijingTime"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "ip": ip,
        "region": region,
        "weatherData": weatherData.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "beijingTime": beijingTime.toIso8601String(),
    };
}

class WeatherData {
    double temperature;
    String windDirection;
    int windPower;
    double humidity;
    String updateTime;
    String weather;
    String visibility;
    double rainfall;
    double pm25;

    WeatherData({
        this.temperature,
        this.windDirection,
        this.windPower,
        this.humidity,
        this.updateTime,
        this.weather,
        this.visibility,
        this.rainfall,
        this.pm25,
    });

    factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        temperature: json["temperature"],
        windDirection: json["windDirection"],
        windPower: json["windPower"],
        humidity: json["humidity"],
        updateTime: json["updateTime"],
        weather: json["weather"],
        visibility: json["visibility"],
        rainfall: json["rainfall"],
        pm25: json["pm25"],
    );

    Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "windDirection": windDirection,
        "windPower": windPower,
        "humidity": humidity,
        "updateTime": updateTime,
        "weather": weather,
        "visibility": visibility,
        "rainfall": rainfall,
        "pm25": pm25,
    };
}
