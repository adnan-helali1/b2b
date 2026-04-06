import 'package:flutter/material.dart';

class AppsColors {
  static const grocery = Color(0xFFDDF3E6);
  static const dairy = Color(0xFFDCE8F5);
  static const bakery = Color(0xFFF3E4CF);
  static const meat = Color(0xFFF5DCDC);
  static const store = Color(0xFFE6DDF3);
  static const snacks = Color(0xFFF6EDC9);
}

class CategoryModel {
  final String title;
  final String count;
  final IconData icon;
  final Color color;

  CategoryModel({
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
  });
}

final categories = [
  CategoryModel(
    title: "خضروات وفواكه",
    count: "145",
    icon: Icons.eco,
    color: AppsColors.grocery,
  ),
  CategoryModel(
    title: "منتجات الألبان",
    count: "89",
    icon: Icons.local_drink,
    color: AppsColors.dairy,
  ),
  CategoryModel(
    title: "مخبوزات",
    count: "67",
    icon: Icons.bakery_dining,
    color: AppsColors.bakery,
  ),
  CategoryModel(
    title: "لحوم ودواجن",
    count: "54",
    icon: Icons.set_meal,
    color: AppsColors.meat,
  ),
  CategoryModel(
    title: "بقالة عامة",
    count: "234",
    icon: Icons.local_grocery_store,
    color: AppsColors.store,
  ),
  CategoryModel(
    title: "وجبات خفيفة",
    count: "112",
    icon: Icons.fastfood,
    color: AppsColors.snacks,
  ),
];
