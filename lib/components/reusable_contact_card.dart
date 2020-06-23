import 'package:flutter/material.dart';
import '../config/constants.dart';

class ReusableContactCard extends StatelessWidget {
  ReusableContactCard(
      {@required this.text, @required this.icon, @required this.onPressed});

  final String text;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          elevation: 7.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 35.0,
              ),
              Icon(
                icon,
                size: 35.0,
                color: Colors.teal,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 18.0,
                      fontFamily: kFontFamily,
                    ),
              ),
              SizedBox(
                height: 35.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
