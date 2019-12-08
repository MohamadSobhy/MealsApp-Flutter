import 'package:flutter/material.dart';

import 'src/data/dumy_data.dart';
import 'src/models/meal_model.dart';
import 'src/pages/category_meals_screen.dart';
import 'src/pages/filters_screen.dart';
import 'src/pages/home_page.dart';
import 'src/pages/meal_details_screen.dart';
import 'src/pages/tabs_screen.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatefulWidget {
  @override
  _MealsAppState createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  List<Meal> _favouritedMeals = [];
  Map<String, bool> _filters = {
    'isGluten-free': false,
    'isLactose-free': false,
    'isVegan': false,
    'isVegetarian': false,
  };
  List<Meal> _filteredMeals = DUMMY_MEALS;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(_favouritedMeals),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(_filteredMeals),
        //TabsScreen.routeName: (_) => TabsScreen(),
        FiltersScreen.routeName: (_) => FiltersScreen(_setFilters, _filters),
        MealDetailsScreen.routeName: (_) => MealDetailsScreen(
              favouriteCallback: _favouriteCallback,
              isFavouriteCallback: _isFavouritedCallback,
            ),
      },
    );
  }

  void _favouriteCallback(String mealId) {
    final currentMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    final mealIndex = _favouritedMeals.indexOf(currentMeal);
    if (mealIndex >= 0) {
      setState(() {
        _favouritedMeals.removeAt(mealIndex);
      });
    } else {
      setState(() {
        _favouritedMeals.add(currentMeal);
      });
    }
  }

  void _setFilters(Map<String, bool> filters) {
    setState(() {
      this._filters = filters;

      _filteredMeals = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filters['isGluten-free']) {
          return false;
        }
        if (!meal.isLactoseFree && _filters['isLactose-free']) {
          return false;
        }
        if (!meal.isVegan && _filters['isVegan']) {
          return false;
        }
        if (!meal.isVegetarian && _filters['isVegetarian']) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isFavouritedCallback(String mealId) {
    final currentMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    final mealIndex = _favouritedMeals.indexOf(currentMeal);
    return mealIndex >= 0;
  }
}
