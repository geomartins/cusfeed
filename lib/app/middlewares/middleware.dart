import 'package:firebase_auth/firebase_auth.dart';
import '../../views/auth/login.dart';
import 'package:simple_router/simple_router.dart';

class Middleware {
  static Future<void> auth() async {
    //SimpleRouter.forward(Login());
//    print('hi');
//    print('middleware');
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      FirebaseUser fb = await _auth.currentUser();
      if (fb == null) {
        _auth.signOut();
      }
    } catch (e) {
      print(e);
    }
  }
}
