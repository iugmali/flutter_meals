import 'package:flutter/material.dart';

import 'pages/filters_page.dart';
import 'pages/meal_detail_page.dart';
import 'pages/tabs_page.dart';
import 'pages/categories_page.dart';
import 'pages/category_meals_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Meals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink, secondary: Colors.amber),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const TabsPage(),
        CategoriesPage.routeName: (ctx) => const CategoriesPage(),
        CategoryMealsPage.routeName: (ctx) => const CategoryMealsPage(),
        MealDetailPage.routeName: (ctx) => const MealDetailPage(),
        FiltersPage.routeName: (ctx) => const FiltersPage()
      },
      onGenerateRoute: (settings) {

      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const CategoriesPage());
      },
    );
  }
}