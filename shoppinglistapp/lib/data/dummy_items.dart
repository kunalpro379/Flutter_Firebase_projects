import 'package:flutter/material.dart';

import 'package:shoppinglistapp/models/grocery_item.dart';
import 'package:shoppinglistapp/models/category.dart';
import 'package:shoppinglistapp/data/categories.dart';

final List<GroceryItem> groceryItemsList = [
  GroceryItem(
    id: 'a',
    name: 'Milk',
    quantity: 1,
    category: categories[Categories.dairy]!,
  ),
  GroceryItem(
    id: 'b',
    name: 'Bananas',
    quantity: 5,
    category: categories[Categories.fruite]!,
  ),
  GroceryItem(
    id: 'c',
    name: 'Beef Steak',
    quantity: 1,
    category: categories[Categories.meat]!,
  ),
];
