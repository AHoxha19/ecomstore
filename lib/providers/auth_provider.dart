import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  static const authOperationSuccessful = "success";

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authState => _firebaseAuth.idTokenChanges();
  Stream<User?> get userChanges => _firebaseAuth.userChanges();

  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return authOperationSuccessful;
    } on FirebaseAuthException catch (e) {
      return "${e.message}";
    }
  }

  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return authOperationSuccessful;
    } on FirebaseAuthException catch (e) {
      return "${e.message}";
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print("Sign out error: $e");
    }
  }
}
