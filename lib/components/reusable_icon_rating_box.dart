import 'package:flutter/material.dart';

class ReusableIconRatingBox extends StatelessWidget {
  ReusableIconRatingBox(
      {@required this.text,
      @required this.icon,
      @required this.color,
      @required this.onPressed});

  final String text;
  final IconData icon;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        icon,
        size: 80.0,
        color: color,
      ),
    );
  }
}
