import 'package:flutter/material.dart';

import '../data/dumy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String routeName = '/categort-details-screen';
  final void Function(String) favouriteCallback;
  final bool Function(String) isFavouriteCallback;

  MealDetailsScreen({
    this.favouriteCallback,
    this.isFavouriteCallback,
  });

  @override
  Widget build(BuildContext context) {
    final routeArgumets =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArgumets['id'];
    final mealData = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          favouriteCallback(mealId);
        },
        child: Icon(
          isFavouriteCallback(mealId) ? Icons.favorite : Icons.favorite_border,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: mealId,
              child: Image.network(
                mealData.imageUrl,
                width: double.infinity,
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            _buildCustomContainer(mealData.ingredients, context, false),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            _buildCustomContainer(mealData.steps, context, true),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomContainer(List<String> data, context, isSteps) {
    return Container(
      height: 150.0,
      width: 280.0,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 1.0,
          color: Colors.black26,
        ),
      ),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (ctx, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: ListTile(
              leading: isSteps
                  ? CircleAvatar(
                      child: Text('#$index'),
                    )
                  : Container(
                      width: 0.0,
                    ),
              title: Text(
                data[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
