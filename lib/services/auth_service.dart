import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static const authOperationSuccessful = "success";

  static final AuthService _authProvider = AuthService._internal();
  AuthService._internal();
  static AuthService get instance => _authProvider;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authState => _firebaseAuth.idTokenChanges();

  //Bonus only
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
