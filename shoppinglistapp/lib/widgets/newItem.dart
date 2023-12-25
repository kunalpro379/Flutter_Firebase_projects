import 'package:flutter/material.dart';

import 'package:shoppinglistapp/models/category.dart';

import 'package:shoppinglistapp/data/categories.dart';

class NewItem extends StatefulWidget {
  const NewItem({Key? key}) : super(key: key);

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final TextEditingController _nameController = TextEditingController();

  Category? _selectedCategory;
  void addItem(contex) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NewItem()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new Item"),
        actions: [
          IconButton(
            onPressed: () {
              addItem(context);
            },
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
                  label: Text("Name"),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return "Must be between 1 and 50 characters...";
                  }
                  return null;
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
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return "Must be a valid +ve number...";
                        }
                        return null;
                      },
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
