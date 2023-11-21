import 'package:flutter/material.dart';
import 'package:flutter_meals/data/dummy_data.dart';
import 'package:flutter_meals/widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  static const routeName = "/categories";

  @override
  Widget build(BuildContext context) {
    return GridView(
            padding: const EdgeInsets.all(25),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            children: DUMMY_CATEGORIES
                .map((e) => CategoryItem(
                      e.id,
                      e.title,
                      e.color,
                      key: Key(e.id),
                    ))
                .toList(),
      );
  }
}
