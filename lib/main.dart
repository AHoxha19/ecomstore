import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/services/auth_service.dart';
import 'package:ecomstore/providers/cart_provider.dart';
import 'package:ecomstore/utils/firebase_initialization_error.dart';
import 'package:ecomstore/utils/loading_spinner.dart';
import 'package:ecomstore/views/home.dart';
import 'package:ecomstore/views/sign_in.dart';
import 'package:ecomstore/views/shopitem_details.dart';
import 'package:ecomstore/views/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  //Used for firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
            return FirebaseInitializationError(
              error: snapshot.error,
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                StreamProvider<User?>.value(
                    value: AuthService.instance.authState, initialData: null),
                //Bonus
                StreamProvider<User?>.value(
                    value: AuthService.instance.userChanges, initialData: null),
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
                  SignInView.routeName: (context) => const SignInView(),
                  SignUpView.routeName: (context) => const SignUpView(),
                  ShopItemDetails.routeName: (context) =>
                      const ShopItemDetails()
                },
                home: const Authenticate(),
              ),
            );
          }
          return const LoadingSpinner();
        });
  }
}

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();
    if (user != null) {
      return const HomeView();
    }
    return const SignInView();
  }
}
