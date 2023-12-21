import 'package:e_learningapp/catogories.dart';
import 'package:e_learningapp/models/meal.dart';
import 'package:e_learningapp/screens/meals.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  const TabScreen({super.key});
  State<StatefulWidget> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  @override
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  void _toggleMealFavStatus(Meal meal) {
    final isExistin = _favoriteMeals.contains(meal);
    if (isExistin) {
      _favoriteMeals.remove(meal);
    } else {
      _favoriteMeals.add(meal);
    }
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget build(BuildContext context) {
    Widget activePage = CateogoryScreen(
      onToggleFavourite: _toggleMealFavStatus,
    );
    var activePageTitle = "Catogories";
    if (_selectedPageIndex == 1) {
      activePage = MealScreen(
        meals: [],
        onToggleFavourite: _toggleMealFavStatus,
      );
      activePageTitle = "Your Favorites...";
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: ' Categories <<<<'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: ' Favorites <<<<')
          ]),
    );
  }
}
