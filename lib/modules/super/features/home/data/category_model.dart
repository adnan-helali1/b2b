import 'package:flutter/material.dart';

class CategoryModel {
  final String image;
  final String title;
  final String count;
  final IconData icon;
  final Color color;

  CategoryModel({
    required this.image,
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
  });
}
