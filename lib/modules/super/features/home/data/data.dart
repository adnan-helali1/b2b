import 'package:b2b/modules/super/features/home/data/appcolor.dart';
import 'package:b2b/modules/super/features/home/data/category_model.dart';
import 'package:flutter/material.dart';

final categories = [
  CategoryModel(
    image: "assets/images/grocery.jpg",
    title: "خضروات وفواكه",
    count: "145",
    icon: Icons.eco,
    color: AppsColors.grocery,
  ),
  CategoryModel(
    image: "assets/images/dairy.jpg",
    title: "منتجات الألبان",
    count: "89",
    icon: Icons.local_drink,
    color: AppsColors.dairy,
  ),
  CategoryModel(
    image: "assets/images/bakery.jpg",
    title: "مخبوزات",
    count: "67",
    icon: Icons.bakery_dining,
    color: AppsColors.bakery,
  ),
  CategoryModel(
    image: "assets/images/meat.jpg",
    title: "لحوم ودواجن",
    count: "54",
    icon: Icons.set_meal,
    color: AppsColors.meat,
  ),
  CategoryModel(
    image: "assets/images/store.jpg",
    title: "بقالة عامة",
    count: "234",
    icon: Icons.local_grocery_store,
    color: AppsColors.store,
  ),
  CategoryModel(
    image: "assets/images/snacks.jpg",
    title: "وجبات خفيفة",
    count: "112",
    icon: Icons.fastfood,
    color: AppsColors.snacks,
  ),
];
