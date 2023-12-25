import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_items.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/widgets/newItem.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addItem(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => const NewItem(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Groceries "),
          actions: [
            IconButton(
                onPressed: () {
                  _addItem(context);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
          itemCount: groceryItemsList.length,
          itemBuilder: (ctx, index) => ListTile(
            title: Text(groceryItemsList[index].name),
            leading: Container(
              width: 25,
              height: 25,
              color: groceryItemsList[index].category.color,
            ),
            trailing: Text(groceryItemsList[index].quantity.toString()),
          ),
        ));
  }
}
