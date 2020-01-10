import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static final routeName = '/meal_detail';

  Widget buildSectionTitle(BuildContext ctx, title) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(ctx).textTheme.title,
        ),
      );

  Widget buildContainer(Widget child) => Container(
        height: 200,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white54,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, i) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(meal.ingredients[i]),
                ),
              ),
              itemCount: meal.ingredients.length,
            )),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, i) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(child: Text('# ${i + 1}')),
                    title: Text(meal.steps[i]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: meal.steps.length,
            )),
          ],
        ),
      ),
    );
  }
}
