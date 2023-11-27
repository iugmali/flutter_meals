import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static String routeName = '/filters';

  final Map<String, bool> filters;
  final Function saveFilters;

  const FiltersPage(this.filters, this.saveFilters, {super.key});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['glutenFree']!;
    _vegetarian = widget.filters['vegetarian']!;
    _vegan = widget.filters['vegan']!;
    _lactoseFree = widget.filters['lactoseFree']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description, bool value,
      void Function(bool) updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: value,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  widget.saveFilters(
                      {
                        'glutenFree': _glutenFree,
                        'lactoseFree': _lactoseFree,
                        'vegan': _vegan,
                        'vegetarian': _vegetarian
                      }
                  );
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Filters saved')));
                },
                icon: const Icon(Icons.save))
          ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile('Gluten-free',
                    'Only include gluten-free meals.', _glutenFree, (val) {
                  setState(() {
                    _glutenFree = val;
                  });
                }),
                _buildSwitchListTile('Lactose-free',
                    'Only include lactose-free meals.', _lactoseFree, (val) {
                  setState(() {
                    _lactoseFree = val;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                    (val) {
                  setState(() {
                    _vegetarian = val;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include vegan meals.', _vegan, (val) {
                  setState(() {
                    _vegan = val;
                  });
                }),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
