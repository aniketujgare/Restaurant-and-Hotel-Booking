// To parse this JSON data, do
//
//     final restaurnatModel = restaurnatModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RestaurnatModel restaurnatModelFromJson(String str) =>
    RestaurnatModel.fromJson(json.decode(str));

String restaurnatModelToJson(RestaurnatModel data) =>
    json.encode(data.toJson());

class RestaurnatModel {
  final int count;
  final List<Restaurant> restaurants;

  RestaurnatModel({
    required this.count,
    required this.restaurants,
  });

  factory RestaurnatModel.fromJson(Map<String, dynamic> json) =>
      RestaurnatModel(
        count: json["count"],
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}

class Restaurant {
  final String id;
  final String name;
  final String tagLine;
  final double score;
  final String logoUrl;
  final List<String> menu;

  Restaurant({
    required this.id,
    required this.name,
    required this.tagLine,
    required this.score,
    required this.logoUrl,
    required this.menu,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["_id"],
        name: json["name"],
        tagLine: json["tagLine"],
        score: json["score"]?.toDouble(),
        logoUrl: json["logoUrl"],
        menu: List<String>.from(json["menu"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "tagLine": tagLine,
        "score": score,
        "logoUrl": logoUrl,
        "menu": List<dynamic>.from(menu.map((x) => x)),
      };
}
