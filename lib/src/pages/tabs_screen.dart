import 'package:flutter/material.dart';
import 'package:meals_app/src/pages/favourites_screen.dart';
import 'package:meals_app/src/pages/home_page.dart';

class TabsScreen extends StatelessWidget {
  static const String routeName = 'tabs-screen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('DeliMeals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Categories',
                icon: Icon(Icons.category),
              ),
              Tab(
                text: 'Favourites',
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // HomeScreen(),
            // FavouritesScreen(),
          ],
        ),
      ),
    );
  }
}
