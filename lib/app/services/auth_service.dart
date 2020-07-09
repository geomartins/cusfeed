import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<AuthResult> login({String email, String password}) async {
    AuthResult authResult;

    authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    return authResult;
  }

  Future<FirebaseUser> user() async {
    FirebaseUser firebaseUser;
    try {
      firebaseUser = await _auth.currentUser();
    } catch (e) {
      print(e);
    }

    return firebaseUser;
  }

  Future<AuthResult> register(String email, String password) async {
    AuthResult authResult;
    try {
      authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
    return authResult;
  }

  Future<void> passwordReset({String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async {
    try {
      _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
