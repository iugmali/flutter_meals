import 'package:flutter/material.dart';

import 'pages/categories_page.dart';
import 'pages/category_meals_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Meals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink, secondary: Colors.amber),
        useMaterial3: true,
      ),
      home: const CategoriesPage(),
      routes: {
        CategoriesPage.routeName: (ctx) => const CategoriesPage(),
        CategoryMealsPage.routeName: (ctx) => const CategoryMealsPage()
      },
    );
  }
}