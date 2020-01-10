import 'package:flutter/material.dart';

import '../screens.dart';

class ListTileBuilder extends StatelessWidget {
  ListTileBuilder(this.title, this.icon, this.routeName);

  final String title;
  final IconData icon;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        if (ModalRoute.of(context).settings.name != routeName) {
          Navigator.of(context).pushReplacementNamed(routeName);
        } else {
          Navigator.of(context).pop();
        }
      },
    );
  }
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          ListTileBuilder('Meals', Icons.restaurant, TabsScreen.routeName),
          ListTileBuilder('Filters', Icons.settings, FiltersScreen.routeName),
        ],
      ),
    );
  }
}
