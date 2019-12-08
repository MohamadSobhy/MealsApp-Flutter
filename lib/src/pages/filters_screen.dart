import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters-page';
  final Function(Map<String, bool> filters) setFiltersCallback;
  final Map<String, bool> filters;

  FiltersScreen(this.setFiltersCallback, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;

  bool _isLactoseFree = false;

  bool _isVegan = false;

  bool _isVegetarian = false;

  @override
  void initState() {
    _isGlutenFree = widget.filters['isGluten-free'];
    _isLactoseFree = widget.filters['isLactose-free'];
    _isVegan = widget.filters['isVegan'];
    _isVegetarian = widget.filters['isVegetarian'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'App Filters',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: Text('Gluten-free'),
                  subtitle: Text('Only Gluten free meals will be displayed.'),
                  value: _isGlutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                      setFilters();
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose-free'),
                  subtitle: Text('Only Lactose free meals will be displayed.'),
                  value: _isLactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                      setFilters();
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  subtitle: Text('Only Vegan meals will be displayed.'),
                  value: _isVegan,
                  onChanged: (newValue) {
                    setState(() {
                      _isVegan = newValue;
                      setFilters();
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian'),
                  subtitle: Text('Only Vegetarian meals will be displayed.'),
                  value: _isVegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                      setFilters();
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void setFilters() {
    widget.setFiltersCallback({
      'isGluten-free': _isGlutenFree,
      'isLactose-free': _isLactoseFree,
      'isVegan': _isVegan,
      'isVegetarian': _isVegetarian,
    });
  }
}
