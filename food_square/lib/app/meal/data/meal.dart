// To parse this JSON data, do
//
//     final meal = mealFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

Meal mealFromJson(String str) => Meal.fromJson(json.decode(str));

String mealToJson(Meal data) => json.encode(data.toJson());

class Meal {
  Meal({
    this.meal,
  });

  List<MealElement> meal;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        meal: List<MealElement>.from(
            json["meal"].map((x) => MealElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meal": List<dynamic>.from(meal.map((x) => x.toJson())),
      };
}

List<String> arr = ["simple", "medium", "hard"];

class MealElement {
  MealElement(
      {this.id,
      this.categories,
      this.title,
      this.affordability,
      this.complexity,
      this.imageUrl,
      this.duration,
      this.ingredients,
      this.steps,
      this.isGlutenFree,
      this.isVegan,
      this.isVegetarian,
      this.isLactoseFree,
      this.complexString,
      this.isFavorite});

  String id;
  List<String> categories;
  String title;
  int affordability;
  int complexity;
  String imageUrl;
  int duration;
  List<String> ingredients;
  List<String> steps;
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;
  String complexString;
  bool isFavorite;

  factory MealElement.fromJson(Map<String, dynamic> json) => MealElement(
      id: json["id"],
      categories: List<String>.from(json["categories"].map((x) => x)),
      title: json["title"],
      affordability: json["affordability"],
      complexity: json["complexity"],
      complexString: arr[json["complexity"]].tr,
      imageUrl: json["imageUrl"],
      duration: json["duration"],
      ingredients: List<String>.from(json["ingredients"].map((x) => x)),
      steps: List<String>.from(json["steps"].map((x) => x)),
      isGlutenFree: json["isGlutenFree"],
      isVegan: json["isVegan"],
      isVegetarian: json["isVegetarian"],
      isLactoseFree: json["isLactoseFree"],
      isFavorite: false);

  Map<String, dynamic> toJson() => {
        "id": id,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "title": title,
        "affordability": affordability,
        "complexity": complexity,
        "imageUrl": imageUrl,
        "duration": duration,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "steps": List<dynamic>.from(steps.map((x) => x)),
        "isGlutenFree": isGlutenFree,
        "isVegan": isVegan,
        "isVegetarian": isVegetarian,
        "isLactoseFree": isLactoseFree,
      };
  @override
  bool operator ==(other) {
    // 判断是否是非
    if (other is! MealElement) {
      return false;
    }
    final MealElement student = other;
    return title == student.title &&
        id == student.id &&
        listEquals(categories, student.categories) &&
        imageUrl == student.imageUrl;
  }

  @override
  int get hashCode => super.hashCode;
}
