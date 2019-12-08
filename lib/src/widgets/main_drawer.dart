import 'package:flutter/material.dart';
import 'package:meals_app/src/pages/home_page.dart';
import '../pages/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
            color: Theme.of(context).accentColor,
            child: Text(
              'Meals App',
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 30.0,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
            leading: Icon(
              Icons.fastfood,
              color: Colors.black,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
            leading: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.title,
            ),
          )
        ],
      ),
    );
  }
}
