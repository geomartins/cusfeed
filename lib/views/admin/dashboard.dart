import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../components/reusable_custom_drawer.dart';
import '../../config/constants.dart';
import '../../app/services/auth_service.dart';
import '../../app/middlewares/middleware.dart';
import '../../components/reusable_rating_panel.dart';

class Dashboard extends StatefulWidget {
  static const String id = '/dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    middleware(); //Middleware
    getInfo();
  }

  void middleware() async {
    await Middleware.auth();
  }

  void getInfo() async {
    FirebaseUser user = await AuthService().user();
    print(user.email);
  }

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
          color: kPrimaryColor,
        ),
      ),
      drawer: ReusableCustomDrawer(deviceWidth: deviceWidth),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ReusableRatingPanel(),
        ],
      ),
    );
  }
}
