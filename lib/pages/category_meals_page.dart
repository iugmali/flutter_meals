import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../data/dummy_data.dart';

class CategoryMealsPage extends StatelessWidget {
  const CategoryMealsPage({super.key});

  static const routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(categoryTitle!),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (ctx, i) {
              return MealItem(
                key: Key(categoryMeals[i].id),
                id: categoryMeals[i].id,
                title: categoryMeals[i].title,
                imageUrl: categoryMeals[i].imageUrl,
                duration: categoryMeals[i].duration,
                complexity: categoryMeals[i].complexity,
                affordability: categoryMeals[i].affordability,
              );
            },
      ),
    ));
  }
}
