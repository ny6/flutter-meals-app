import 'package:flutter/material.dart';

class MySwitchTile extends StatelessWidget {
  MySwitchTile(
    this.title,
    this.subtitle,
    this.value,
    this.onChange,
  );

  final String title;
  final String subtitle;
  final bool value;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChange,
    );
  }
}
