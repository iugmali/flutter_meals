import 'package:flutter/material.dart';
import 'package:flutter_meals/data/dummy_data.dart';
import 'package:flutter_meals/models/meal.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = "/meal-detail";

  const MealDetailPage({super.key});

  Widget _buildSectionTitle(BuildContext ctx, String title) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          title,
          style: Theme
              .of(ctx)
              .textTheme
              .titleMedium,
        ));
  }

  Widget _buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute
        .of(context)
        ?.settings
        .arguments as String;
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(meal.title),
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .inversePrimary,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                      meal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                _buildSectionTitle(context, 'Ingredients'),
                _buildContainer(ListView.builder(
                    itemCount: meal.ingredients.length,
                    itemBuilder: (_, i) =>
                        Card(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .secondary,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: Text(meal.ingredients[i]),
                          ),
                        ))
                ),
                _buildSectionTitle(context, 'Steps'),
                _buildContainer(ListView.builder(
                    itemCount: meal.steps.length,
                    itemBuilder: (_, i) =>
                        Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(child: Text('# ${i + 1}'),),
                              title: Text(meal.steps[i]),
                            ),
                            const Divider()
                          ],
                        )))
              ],
            ),
          ),
        ));
  }
}
