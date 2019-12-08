import 'package:flutter/material.dart';
import 'package:meals_app/src/models/meal_model.dart';
import 'package:meals_app/src/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouritedMeals;

  FavouritesScreen(this.favouritedMeals);

  @override
  Widget build(BuildContext context) {
    return favouritedMeals.isEmpty
        ? Center(
            child: Text(
              'There is no favourtie meals. try add some!',
            ),
          )
        : ListView.builder(
            itemCount: favouritedMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favouritedMeals[index].id,
                title: favouritedMeals[index].title,
                imageUrl: favouritedMeals[index].imageUrl,
                duration: favouritedMeals[index].duration,
                complexity: favouritedMeals[index].complexity,
                affordability: favouritedMeals[index].affordability,
              );
            },
          );
  }
}
