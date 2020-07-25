import 'package:flutter/material.dart';
import './reusable_drawer_menu.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../app/services/auth_service.dart';
import '../views/admin/dashboard.dart';
import '../views/admin/profile.dart';
import '../views/admin/history.dart';
import '../views/admin/change_password.dart';
import '../views/auth/login.dart';
import '../views/admin/contact_us.dart';

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
                Navigator.pushNamed(context, Dashboard.id);
              },
            ),
            ReusableDrawerMenu(
              icon: FontAwesome.user,
              text: 'Profile',
              onPressed: () {
                Navigator.pushNamed(context, Profile.id);
              },
            ),
            ReusableDrawerMenu(
              icon: FontAwesome.history,
              text: 'History',
              onPressed: () {
                Navigator.pushNamed(context, History.id);
              },
            ),
            ReusableDrawerMenu(
              icon: FontAwesome.chain_broken,
              text: 'Password',
              onPressed: () {
                Navigator.pushNamed(context, ChangePassword.id);
              },
            ),
            ReusableDrawerMenu(
              icon: Icons.contacts,
              text: 'Contact Us',
              onPressed: () {
                Navigator.pushNamed(context, ContactUs.id);
              },
            ),
            ReusableDrawerMenu(
              icon: FontAwesome.sign_out,
              text: 'Sign Out',
              onPressed: () async {
                AuthService authService = new AuthService();
                await authService.logout();
                Navigator.pushReplacementNamed(context, Login.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
