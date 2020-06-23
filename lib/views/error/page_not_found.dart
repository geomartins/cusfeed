import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 20.0, bottom: 100.0),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/error3.png"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
//            Row(
//              children: <Widget>[
//                Expanded(
//                  child: Image.asset('assets/images/password.jpg'),
//                ),
//              ],
//            ),
//            SizedBox(
//              height: 20.0,
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text('404 Error.',
//                    style: Theme.of(context).textTheme.display1.copyWith(
//                          fontWeight: FontWeight.w400,
//                          color: Colors.black,
//                        )),
//              ],
//            ),
//            SizedBox(
//              height: 5.0,
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text('We cant find the page you are looking for'),
//              ],
//            ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: OutlineButton(
//                      borderSide: BorderSide(
//                        color: Theme.of(context).buttonColor,
//                      ),
                      color: Colors.teal,
                      //elevation: 5.0,
                      shape: StadiumBorder(),
                      child: Text(
                        'Back to home',
                        style: TextStyle(color: Colors.teal),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
