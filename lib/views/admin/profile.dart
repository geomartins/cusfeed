import 'package:flutter/material.dart';
import '../../components/reusable_custom_drawer.dart';
import '../../components/reusable_profile_list_tile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.grey,
              height: 200.0,
              width: deviceWidth,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.teal,
                    maxRadius: 30.0,
                    child: Text(
                      'MA',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ),
          ),
          ReusableProfileListTile(
            elevation: 20.0,
            icon: Icons.mail_outline,
            title: 'martinsabiodun94@gmail.com',
            subtitle: 'Email Address',
          ),
          ReusableProfileListTile(
            elevation: 10.0,
            icon: Icons.nature,
            title: 'FoodPark Limited',
            subtitle: 'Company Name',
          ),
          ReusableProfileListTile(
            elevation: 5.0,
            icon: Icons.location_on,
            title: 'Lagos Nigeria',
            subtitle: 'Location',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  onPressed: () {
                    Navigator.pushNamed(context, '/change_password');
                  },
                  child: Text(
                    'Change Password',
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
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                width: deviceWidth / 2.3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
