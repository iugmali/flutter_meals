import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './favorites_page.dart';
import './categories_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {

  final List<Map<String, Object>> _pages = const [
    {'page': CategoriesPage(), 'title': 'Categories'},
    {'page': FavoritesPage(), 'title': 'Favorites'},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(_pages[_selectedPageIndex]['title'] as String),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          drawer: const MainDrawer(),
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,

            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            currentIndex: _selectedPageIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  tooltip: 'Categories',

                  label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  tooltip: 'Favorites',
                  label: 'Favorites'),
            ],
          ),
          body: _pages[_selectedPageIndex]['page'] as Widget,
      )
    );
  }
}
