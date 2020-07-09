import 'package:flutter/material.dart';

mixin Snackbar {
  void notify({BuildContext context, String message, Color color}) {
    Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        elevation: 1.0,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.info),
            SizedBox(
              width: 10.0,
            ),
            Text(
              message,
            ),
          ],
        )));
  }
}

//      SnackBar(
//        elevation: 0.0,
//        //behavior: SnackBarBehavior.floating,
//        content: Text(message),
//        duration: new Duration(seconds: 5000000),
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
//        ),
//        //backgroundColor: Colors.redAccent,
//        action: SnackBarAction(
//          textColor: Color(0xFFFAF2FB),
//          label: 'OK',
//          onPressed: () {},
//        ),
//      ),
