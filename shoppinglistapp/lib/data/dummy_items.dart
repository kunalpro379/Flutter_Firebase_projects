import 'package:shopping_list_app/models/category.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/models/grocery_item.dart';

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
