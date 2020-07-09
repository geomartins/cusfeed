import 'package:cusfeed/views/admin/change_password.dart';
import 'package:flutter/material.dart';
import '../../components/reusable_custom_drawer.dart';
import '../../components/reusable_profile_list_tile.dart';
import '../../app/services/auth_service.dart';
import '../../config/constants.dart';
import '../auth/login.dart';

class Profile extends StatefulWidget {
  static const String id = '/profile';

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
          color: kPrimaryColor,
        ),
      ),
      drawer: ReusableCustomDrawer(
        deviceWidth: deviceWidth,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cool_bg2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
//                color: Colors.grey,
                height: 200.0,
                width: deviceWidth,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
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
                      Navigator.pushNamed(context, ChangePassword.id);
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
                    onPressed: () async {
                      AuthService authService = new AuthService();
                      await authService.logout();
                      Navigator.pushNamed(context, Login.id);
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
      ),
    );
  }
}
