// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:shoppinglistapp/models/grocery_item.dart';
import 'package:shoppinglistapp/models/category.dart';
import 'package:shoppinglistapp/widgets/newItem.dart';
import 'package:shoppinglistapp/data/categories.dart';
import 'package:shoppinglistapp/widgets/grocery_list.dart';
import 'package:shoppinglistapp/data/dummy_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Groceries',
        theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 147, 229, 250),
            brightness: Brightness.dark,
            surface: const Color.fromARGB(255, 42, 51, 59),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
        ),
        home: const GroceryList());
  }
}
