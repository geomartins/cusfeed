import 'package:flutter/material.dart';
import './reusable_drawer_menu.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ReusableCustomDrawer extends StatelessWidget {
  ReusableCustomDrawer({@required this.deviceWidth});

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth / 3,
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            ReusableDrawerMenu(
              icon: FontAwesome.home,
              text: 'Dashboard',
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            ReusableDrawerMenu(
              icon: FontAwesome.user,
              text: 'Profile',
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ReusableDrawerMenu(
              icon: FontAwesome.history,
              text: 'History',
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
            ),
            ReusableDrawerMenu(
              icon: FontAwesome.chain_broken,
              text: 'Password',
              onPressed: () {
                Navigator.pushNamed(context, '/change_password');
              },
            ),
            ReusableDrawerMenu(
              icon: Icons.contacts,
              text: 'Contact Us',
              onPressed: () {
                Navigator.pushNamed(context, '/contact_us');
              },
            ),
            ReusableDrawerMenu(
              icon: FontAwesome.sign_out,
              text: 'Sign Out',
              onPressed: () {
                Navigator.pushNamed(context, '');
              },
            ),
          ],
        ),
      ),
    );
  }
}
