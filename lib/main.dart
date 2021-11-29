import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/providers/auth_provider.dart';
import 'package:ecomstore/providers/cart_provider.dart';
import 'package:ecomstore/views/home.dart';
import 'package:ecomstore/views/sign_in.dart';
import 'package:ecomstore/views/shopitem_details.dart';
import 'package:ecomstore/views/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  //Used for firebase
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const EcomstoreApp());
}

class EcomstoreApp extends StatefulWidget {
  const EcomstoreApp({Key? key}) : super(key: key);

  @override
  State<EcomstoreApp> createState() => _EcomstoreAppState();
}

class _EcomstoreAppState extends State<EcomstoreApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return MaterialApp(
              home: Scaffold(
                body: Container(
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    "Error when initializing Firebase SDK:\n${snapshot.error}",
                    style: const TextStyle(fontSize: 20),
                  )),
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                Provider<AuthProvider>(
                  create: (_) => AuthProvider(),
                ),
                StreamProvider<User?>.value(
                    value: AuthProvider().authState, initialData: null),
                StreamProvider<User?>.value(
                    value: AuthProvider().userChanges, initialData: null),
                ChangeNotifierProvider(create: (_) => CartProvider()),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Ecomstore',
                theme: ThemeData(
                  primarySwatch: kWhiteColorPrimarySwatch,
                  textTheme: GoogleFonts.montserratTextTheme(
                    Theme.of(context).textTheme,
                  ),
                ),
                routes: {
                  HomeView.routeName: (context) => const HomeView(),
                  SignUpView.routeName: (context) => const SignUpView(),
                  ShopItemDetails.routeName: (context) =>
                      const ShopItemDetails()
                },
                home: const Authenticate(),
              ),
            );
          }
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(
                color: kLogoColor,
              ),
            ),
          );
        });
  }
}

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user != null) {
      return const HomeView();
    }
    return const SignInView();
  }
}
