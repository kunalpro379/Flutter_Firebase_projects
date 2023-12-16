import 'package:e_learningapp/Catogory.dart';
import 'package:e_learningapp/data/dummy_data.dart';
import 'package:e_learningapp/screens/meals.dart';
import 'package:flutter/material.dart';
import 'package:e_learningapp/widgets/catogoryitem.dart';
import 'package:google_fonts/google_fonts.dart';

class CateogoryScreen extends StatelessWidget {
  const CateogoryScreen({super.key});
  void _selectCategory(BuildContext context, Catogory catogory) {
    final filtermeals = dummyMeals
        .where((meal) => meal.categories.contains(catogory.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            MealScreen(title: catogory.title, meals: filtermeals)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick Yuor Category"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final catogory in availableCategories)
            CatogaryGridItem(
                catogory: catogory,
                onSelectCategory: () {
                  _selectCategory(context, catogory);
                })
        ],
      ),
    );
  }
}
