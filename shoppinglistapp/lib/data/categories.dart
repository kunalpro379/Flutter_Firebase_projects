import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/category.dart'; // Import your custom Category and Categories
import 'package:shopping_list_app/data/categories.dart'; // Import your custom Categories enum
import 'package:shopping_list_app/models/grocery_item.dart';

final categories = {
  Categories.vegetables: Category(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruite: Category(
    // Fix the spelling mistake here
    'Fruit',
    Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.meat: Category(
    'Meat',
    Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.dairy: Category(
    'Dairy',
    Color.fromARGB(255, 0, 208, 255),
  ),
  Categories.carbs: Category(
    'Carbs',
    Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.sweets: Category(
    'Sweets',
    Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: Category(
    'Spices',
    Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: Category(
    'Convenience',
    Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: Category(
    'Hygiene',
    Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: Category(
    'Other',
    Color.fromARGB(255, 0, 225, 255),
  ),
};
