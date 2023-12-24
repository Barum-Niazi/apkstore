// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  int id;
  String name;
  String image1Url;
  String image2Url;
  String image3Url;
  String image4Url;
  String instagramDescription;
  String category;
  String downloadLink;
  String size;
  double rating;

  Welcome({
    required this.id,
    required this.name,
    required this.image1Url,
    required this.image2Url,
    required this.image3Url,
    required this.image4Url,
    required this.instagramDescription,
    required this.category,
    required this.downloadLink,
    required this.size,
    required this.rating,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        name: json["name"],
        image1Url: json["image1Url"],
        image2Url: json["image2Url"],
        image3Url: json["image3Url"],
        image4Url: json["image4Url"],
        instagramDescription: json["instagramDescription"],
        category: json["category"],
        downloadLink: json["downloadLink"],
        size: json["size"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image1Url": image1Url,
        "image2Url": image2Url,
        "image3Url": image3Url,
        "image4Url": image4Url,
        "instagramDescription": instagramDescription,
        "category": category,
        "downloadLink": downloadLink,
        "size": size,
        "rating": rating,
      };
}
