import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  static const authOperationSuccessful = "success";

  static final AuthProvider _authProvider = AuthProvider._internal();
  AuthProvider._internal();
  static AuthProvider get instance => _authProvider;

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

  Future<String> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return authOperationSuccessful;
    } catch (e) {
      print("Sign out error: $e");
      return "$e";
    }
  }
}
