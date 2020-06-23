import 'package:flutter/material.dart';
import '../../components/reusable_custom_drawer.dart';
import '../../components/reusable_icon_rating_box.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Rate Our Service',
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.teal,
        ),
      ),
      drawer: ReusableCustomDrawer(deviceWidth: deviceWidth),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ReusableIconRatingBox(
                text: 'Smile',
                icon: FontAwesome.smile_o,
                color: Colors.teal,
                onPressed: () {
                  Navigator.pushNamed(context, '/success');
                },
              ),
              ReusableIconRatingBox(
                text: 'Smile',
                icon: FontAwesome.smile_o,
                color: Colors.teal,
                onPressed: () {},
              ),
              ReusableIconRatingBox(
                text: 'Smile',
                icon: FontAwesome.smile_o,
                color: Colors.teal,
                onPressed: () {},
              ),
              ReusableIconRatingBox(
                text: 'Smile',
                icon: FontAwesome.smile_o,
                color: Colors.teal,
                onPressed: () {},
              ),
              ReusableIconRatingBox(
                text: 'Smile',
                icon: FontAwesome.smile_o,
                color: Colors.teal,
                onPressed: () {},
              ),
              ReusableIconRatingBox(
                text: 'Smile',
                icon: FontAwesome.smile_o,
                color: Colors.teal,
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
