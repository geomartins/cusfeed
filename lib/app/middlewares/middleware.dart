import 'package:firebase_auth/firebase_auth.dart';

class Middleware {
  static Future<void> auth() async {
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
