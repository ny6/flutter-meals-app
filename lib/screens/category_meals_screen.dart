import 'package:flutter/material.dart';

import '../widgets.dart';
import '../models.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/catgory_meals';
  CategoryMealsScreen(this.avaliableMeals);

  final List<Meal> avaliableMeals;

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> meals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      final String categoryId = routeArgs['id'];

      categoryTitle = routeArgs['title'];
      meals = widget.avaliableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;
    }
  }

  void _removeMeal(String id) {
    setState(() {
      meals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => MealItem(meals[i], _removeMeal),
        itemCount: meals.length,
      ),
    );
  }
}
