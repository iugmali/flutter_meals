import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersPage extends StatelessWidget {
  const FiltersPage({super.key});

  static String routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('Filters'), backgroundColor: Theme.of(context).colorScheme.inversePrimary,),
      drawer: const MainDrawer(),
    ),
    );
  }
}
