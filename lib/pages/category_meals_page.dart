import 'package:flutter/material.dart';

class CategoryMealsPage extends StatelessWidget {

  const CategoryMealsPage({super.key});

  static const routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(categoryTitle!),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: Container(
            child: Center(
              child: Text("category meals"),
            ),
          ),
    ));
  }
}
