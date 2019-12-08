import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import '../pages/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    this.id,
    this.title,
    this.imageUrl,
    this.duration,
    this.complexity,
    this.affordability,
  });

  String get _complexity {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
      case Complexity.Challenging:
        return 'challenging';
      case Complexity.Hard:
        return 'hard';
      default:
        return 'Unknown';
    }
  }

  String get _affordability {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MealDetailsScreen.routeName, arguments: {
          'id': id,
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: id,
                    child: Image.network(
                      imageUrl,
                      height: 200.0,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    right: 0.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      width: 300.0,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                        ),
                      ),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildInfoRow(
                  title: '$duration mins',
                  icon: Icons.schedule,
                ),
                _buildInfoRow(
                  title: '$_complexity',
                  icon: Icons.work,
                ),
                _buildInfoRow(
                  title: '$_affordability',
                  icon: Icons.attach_money,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildInfoRow({String title, IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(title),
        ],
      ),
    );
  }
}
