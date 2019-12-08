import 'package:flutter/material.dart';
import '../models/meal_model.dart';

import '../widgets/main_drawer.dart';
import 'categories_page.dart';
import 'favourites_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-page';
  final List<Meal> favouritedMeals;

  HomeScreen(this.favouritedMeals);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItemIndex = 0;
  List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _pages = [
      {
        'title': 'Categories',
        'page': CategoriesScreen(),
      },
      {
        'title': 'Favourites',
        'page': FavouritesScreen(widget.favouritedMeals),
      }
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedItemIndex]['title']),
      ),
      body: _buildPageContent(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedItemIndex,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            title: Text('Categories'),
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            title: Text('Favourites'),
            icon: Icon(Icons.favorite),
          ),
        ],
        onTap: _changePageContent,
      ),
    );
  }

  void _changePageContent(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  Widget _buildPageContent() {
    return _pages[_selectedItemIndex]['page'];
  }
}
