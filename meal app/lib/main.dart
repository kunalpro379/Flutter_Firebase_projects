import 'package:e_learningapp/catogories.dart';
import 'package:e_learningapp/data/dummy_data.dart';
import 'package:e_learningapp/screens/meals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_learningapp/widgets/catogoryitem.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Color.fromARGB(229, 255, 0, 72),
        brightness: Brightness.dark),
    textTheme: GoogleFonts.latoTextTheme());

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: CateogoryScreen()
        //MealScreen(title: "Some Category ... ", meals: dummyMeals),
        );
  }
}
