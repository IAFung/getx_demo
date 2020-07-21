// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.category,
  });

  List<CategoryElement> category;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        category: List<CategoryElement>.from(
            json["category"].map((x) => CategoryElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

class CategoryElement {
  CategoryElement({this.id, this.title, this.color, this.realColor});

  String id;
  String title;
  String color;
  Color realColor;

  factory CategoryElement.fromJson(Map<String, dynamic> json) {
    String color = json["color"];
    Color realColor = Color(int.parse(color, radix: 16) | 0xFF000000);

    return CategoryElement(
        id: json["id"],
        title: json["title"],
        color: color,
        realColor: realColor);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "color": color,
      };
}
