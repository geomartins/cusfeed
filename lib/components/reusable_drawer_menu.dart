import 'package:flutter/material.dart';

class ReusableDrawerMenu extends StatelessWidget {
  ReusableDrawerMenu(
      {@required this.icon, @required this.onPressed, @required this.text});

  final IconData icon;
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: onPressed,
          child: Icon(
            icon,
            size: 40.0,
            color: Colors.teal,
          ),
        ),
        Text(text),
        Divider(),
      ],
    );
  }
}
