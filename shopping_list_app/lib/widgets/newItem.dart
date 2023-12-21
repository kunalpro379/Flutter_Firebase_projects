import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/models/category.dart';

class NewItem extends StatefulWidget {
  const NewItem({Key? key}) : super(key: key);

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  // Add a controller for the text field
  final TextEditingController _nameController = TextEditingController();

  // Add a variable to store the selected category
  Category? _selectedCategory;

  // Function to handle adding an item
  void _addItem() {
    // Implement the logic to add the item
    // You can use _nameController.text to get the item name
    // and _selectedCategory to get the selected category
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new Item"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                controller: _nameController, // Assign the controller
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
                validator: (value) {
                  return "Demo ...";
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Quantity",
                      ),
                      initialValue: "(1)",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: categories.entries
                          .map((category) => DropdownMenuItem(
                                value: category.value,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      color: category.value.color,
                                    ),
                                    const SizedBox(width: 15),
                                    Text(category.value.title),
                                  ],
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value as Category?;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: const Text("(Reset)")),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("(Add Item)"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
