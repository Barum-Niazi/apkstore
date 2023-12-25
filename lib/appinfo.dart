// To parse this JSON data, do
//
//     final appInfo = appInfoFromJson(jsonString);

import 'dart:convert';

List<AppInfo> samplePostsFromJson(String str) =>
    List<AppInfo>.from(json.decode(str).map((x) => AppInfo.fromJson(x)));

String samplePostsToJson(List<AppInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppInfo {
  int id;
  String name;
  String image1Url;
  String image2Url;
  String image3Url;
  String image4Url;
  String description;
  String category;
  String downloadLink;
  String size;
  String rating;

  AppInfo({
    required this.id,
    required this.name,
    required this.image1Url,
    required this.image2Url,
    required this.image3Url,
    required this.image4Url,
    required this.description,
    required this.category,
    required this.downloadLink,
    required this.size,
    required this.rating,
  });

  factory AppInfo.fromJson(Map<String, dynamic> json) => AppInfo(
        id: json["id"],
        name: json["name"],
        image1Url: json["image1Url"],
        image2Url: json["image2Url"],
        image3Url: json["image3Url"],
        image4Url: json["image4Url"],
        description: json["description"],
        category: json["category"],
        downloadLink: json["downloadLink"],
        size: json["size"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image1Url": image1Url,
        "image2Url": image2Url,
        "image3Url": image3Url,
        "image4Url": image4Url,
        "Description": description,
        "category": category,
        "downloadLink": downloadLink,
        "size": size,
        "rating": rating,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
