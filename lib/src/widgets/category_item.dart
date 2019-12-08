import 'package:flutter/material.dart';
import 'package:meals_app/src/pages/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({this.id, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20.0),
      onTap: () {
        Navigator.of(context).pushNamed(
          CategoryMealsScreen.routeName,
          arguments: {
            'id': id,
            'title': title,
            'color': color,
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
