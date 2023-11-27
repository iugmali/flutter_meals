import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsPage extends StatefulWidget {
  List<Meal> availableMeals;

  CategoryMealsPage(this.availableMeals, {super.key});

  static const routeName = "/category-meals";

  @override
  State<CategoryMealsPage> createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle = '';
  List<Meal> categoryMeals = [];

  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'] ?? '';
    final categoryId = routeArgs['id'];
    categoryMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(categoryTitle),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: ListView.builder(
            itemCount: categoryMeals!.length,
            itemBuilder: (ctx, i) {
              return MealItem(
                key: Key(categoryMeals![i].id),
                id: categoryMeals![i].id,
                title: categoryMeals![i].title,
                imageUrl: categoryMeals![i].imageUrl,
                duration: categoryMeals![i].duration,
                complexity: categoryMeals![i].complexity,
                affordability: categoryMeals![i].affordability,
                removeItem: _removeMeal,
              );
            },
      ),
    ));
  }
}
