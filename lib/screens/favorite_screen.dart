import 'package:flutter/material.dart';

import '../models.dart';
import '../widgets.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen(this.favoriteMeals);

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }

    return ListView.builder(
      itemBuilder: (ctx, i) => MealItem(favoriteMeals[i]),
      itemCount: favoriteMeals.length,
    );
  }
}
