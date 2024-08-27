import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<User?> signInWithEmail(
      {required String email, required String password}) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      rethrow;
    }
  }

  static Future<User?> registerWithEmail(
      {required String email, required String password}) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
