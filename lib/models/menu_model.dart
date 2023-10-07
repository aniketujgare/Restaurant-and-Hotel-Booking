// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MenuModel menuModelFromJson(String str) => MenuModel.fromJson(json.decode(str));

String menuModelToJson(MenuModel data) => json.encode(data.toJson());

class MenuModel {
  final List<Menu> menu;

  MenuModel({
    required this.menu,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
      };
}

class Menu {
  final String id;
  final String restaurantId;
  final String category;
  final String name;
  final int price;
  final String imgUrl;
  final int v;

  Menu({
    required this.id,
    required this.restaurantId,
    required this.category,
    required this.name,
    required this.price,
    required this.imgUrl,
    required this.v,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["_id"],
        restaurantId: json["_restaurantId"],
        category: json["category"],
        name: json["name"],
        price: json["price"],
        imgUrl: json["imgUrl"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_restaurantId": restaurantId,
        "category": category,
        "name": name,
        "price": price,
        "imgUrl": imgUrl,
        "__v": v,
      };
}
