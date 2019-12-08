import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/category-meals';
  final List<Meal> filteredMeals;

  CategoryMealsScreen(this.filteredMeals);

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final categoryTitle = routeArguments['title'] as String;
    final categoryId = routeArguments['id'];
    final categoryColor = routeArguments['color'] as Color;

    final categoryMeals = filteredMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: categoryColor,
        title: Text(categoryTitle),
      ),
      body: Center(
        child: categoryMeals.isEmpty
            ? Text('List of recipes is going to be here!!')
            : ListView.builder(
                itemCount: categoryMeals.length,
                itemBuilder: (ctx, index) {
                  return MealItem(
                    id: categoryMeals[index].id,
                    title: categoryMeals[index].title,
                    imageUrl: categoryMeals[index].imageUrl,
                    duration: categoryMeals[index].duration,
                    complexity: categoryMeals[index].complexity,
                    affordability: categoryMeals[index].affordability,
                  );
                },
              ),
      ),
    );
  }
}
