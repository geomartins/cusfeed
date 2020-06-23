import 'package:flutter/material.dart';

class ReusableProfileListTile extends StatelessWidget {
  ReusableProfileListTile({
    @required this.elevation,
    @required this.icon,
    @required this.title,
    @required this.subtitle,
  });
  final double elevation;
  final IconData icon;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.teal,
              size: 30.0,
            ),
          ],
        ),
        subtitle: Text(subtitle),
        title: Text(title),
      ),
    );
  }
}
