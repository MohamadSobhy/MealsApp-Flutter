import 'package:flutter/material.dart';

import './../data/dumy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15.0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 3 / 2,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (category) => CategoryItem(
              id: category.id,
              title: category.title,
              color: category.color,
            ),
          )
          .toList(),
    );
  }
}
