import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../components/reusable_custom_drawer.dart';
import '../../config/constants.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Success',
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.teal,
        ),
      ),
      drawer: ReusableCustomDrawer(
        deviceWidth: deviceWidth,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/contact.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                height: 130.0,
                width: deviceWidth,
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  maxRadius: 40.0,
                  child: Icon(
                    FontAwesome.check,
                    color: Colors.white,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text('Thanks for Rating our service')],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Done',
                      style: Theme.of(context).textTheme.button.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    color: Theme.of(context).buttonColor,
                  ),
                  width: deviceWidth / 2.3,
                ),
                SizedBox(
                  child: OutlineButton(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).buttonColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  width: deviceWidth / 2.3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
