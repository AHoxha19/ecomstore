import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/providers/auth_provider.dart';
import 'package:ecomstore/providers/cart_provider.dart';
import 'package:ecomstore/providers/ecom_provider.dart';
import 'package:ecomstore/providers/favorite_provider.dart';
import 'package:ecomstore/views/cart.dart';
import 'package:ecomstore/views/favorite.dart';
import 'package:ecomstore/views/catalog.dart';
import 'package:ecomstore/views/home.dart';
import 'package:ecomstore/views/sign_in.dart';
import 'package:ecomstore/views/profile.dart';
import 'package:ecomstore/views/shopitem_details.dart';
import 'package:ecomstore/views/sign_up.dart';
import 'package:ecomstore/widgets/ecomstore_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

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
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
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
                    style: TextStyle(fontSize: 20),
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
                ChangeNotifierProvider(create: (_) => EcomProvider()),
                ChangeNotifierProvider(create: (_) => CartProvider()),
                ChangeNotifierProvider(create: (_) => FavoriteProvider()),
              ],
              child: MaterialApp(
                title: 'Ecomstore',
                theme: ThemeData(
                  primarySwatch: kWhiteColorPrimarySwatch,
                  textTheme: GoogleFonts.montserratTextTheme(
                    Theme.of(context).textTheme,
                  ),
                ),
                routes: {
                  SignUpView.routeName: (context) => const SignUpView(),
                  ShopItemDetails.routeName: (context) =>
                      const ShopItemDetails()
                },
                home: Authenticate(),
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
      return HomeView();
    }
    return SignInView();
  }
}
