import 'package:flutter/material.dart';

import 'data/dummy_data.dart';
import 'models/meal.dart';
import 'pages/filters_page.dart';
import 'pages/meal_detail_page.dart';
import 'pages/tabs_page.dart';
import 'pages/categories_page.dart';
import 'pages/category_meals_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['glutenFree']! && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactoseFree']! && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !element.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(_availableMeals),
        MealDetailPage.routeName: (ctx) => const MealDetailPage(),
        FiltersPage.routeName: (ctx) => FiltersPage(_filters, _setFilters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const CategoriesPage());
      },
    );
  }
}