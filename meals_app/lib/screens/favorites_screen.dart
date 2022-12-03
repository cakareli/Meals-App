import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(
    this.favoriteMeals, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => MealItem(
        id: favoriteMeals[index].id,
        title: favoriteMeals[index].title,
        imageUrl: favoriteMeals[index].imageUrl,
        duration: favoriteMeals[index].duration,
        complexity: favoriteMeals[index].complexity,
        affordability: favoriteMeals[index].affordability,
      ),
      itemCount: favoriteMeals.length,
    );
  }
}
