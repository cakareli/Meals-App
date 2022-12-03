import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const namedRoute = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(
    this.saveFilters,
    this.currentFilters, {
    super.key,
  });

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget.currentFilters['gluten'] as bool;
    _isLactoseFree = widget.currentFilters['lactose'] as bool;
    _isVegan = widget.currentFilters['vegan'] as bool;
    _isVegetarian = widget.currentFilters['vegetarian'] as bool;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  value: _isGlutenFree,
                  onChanged: (value) {
                    setState(
                      () {
                        _isGlutenFree = value;
                      },
                    );
                  },
                  title: const Text('Gluten-free'),
                  subtitle: const Text('Only include gluten-free meals'),
                ),
                SwitchListTile(
                  value: _isLactoseFree,
                  onChanged: (value) {
                    setState(
                      () {
                        _isLactoseFree = value;
                      },
                    );
                  },
                  title: const Text('Lactose-free'),
                  subtitle: const Text('Only lactose-free meals'),
                ),
                SwitchListTile(
                  value: _isVegetarian,
                  onChanged: (value) {
                    setState(
                      () {
                        _isVegetarian = value;
                      },
                    );
                  },
                  title: const Text('Vegeterian'),
                  subtitle: const Text('Only include vegetarian meals'),
                ),
                SwitchListTile(
                  value: _isVegan,
                  onChanged: (value) {
                    setState(
                      () {
                        _isVegan = value;
                      },
                    );
                  },
                  title: const Text('Vegan'),
                  subtitle: const Text('Only include vegan meals'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
