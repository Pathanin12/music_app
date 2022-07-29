// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class BoxPlayModel {
  BoxPlayModel({
    this.image,
    this.name,
    this.uri,
    this.title,
    required this.index
  });

  String? image;
  String? name;
  String? uri;
  String? title;
  int index;

  factory BoxPlayModel.fromRawJson(String str) => BoxPlayModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoxPlayModel.fromJson(Map<String, dynamic> json) => BoxPlayModel(
    image: json["image"] == null ? null : json["image"],
    name: json["name"] ?? null,
    uri: json["uri"] == null ? null : json["uri"],
    title: json["title"] == null ? null : json["title"],
    index: json["index"] == null ? null : json["index"]
  );

  Map<String, dynamic> toJson() => {
    "image": image == null ? null : image,
    "name": name == null ? null : name,
    "uri": uri == null ? null : uri,
    "title": title == null ? null : title,
    "index":index == null ? null : index
  };
}
