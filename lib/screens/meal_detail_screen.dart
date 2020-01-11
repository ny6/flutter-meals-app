import 'package:flutter/material.dart';

import '../models.dart';

class SectionTile extends StatelessWidget {
  SectionTile(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  ListViewBuilder(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
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
  }
}

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  final Function toggleFavorite;
  final Function isFavorite;

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
            SectionTile('Ingredients'),
            ListViewBuilder(ListView.builder(
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
            SectionTile('Steps'),
            ListViewBuilder(ListView.builder(
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
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(meal.id) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorite(meal.id),
      ),
    );
  }
}
