import 'package:ecomstore/api/ecomstore_api.dart';
import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/api/auth_service.dart';
import 'package:ecomstore/providers/cart_provider.dart';
import 'package:ecomstore/providers/catalog_provider.dart';
import 'package:ecomstore/providers/favorite_provider.dart';
import 'package:ecomstore/providers/settings_provider.dart';
import 'package:ecomstore/repository/ecomstore_repository.dart';
import 'package:ecomstore/utils/firebase_initialization_error.dart';
import 'package:ecomstore/utils/loading_spinner.dart';
import 'package:ecomstore/views/home.dart';
import 'package:ecomstore/views/sign_in.dart';
import 'package:ecomstore/views/shopitem_details.dart';
import 'package:ecomstore/views/sign_up.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const Settings());
}

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsProvider(),
      child: const EcomstoreApp(),
    );
  }
}

class EcomstoreApp extends StatefulWidget {
  const EcomstoreApp({Key? key}) : super(key: key);

  @override
  State<EcomstoreApp> createState() => _EcomstoreAppState();
}

class _EcomstoreAppState extends State<EcomstoreApp> {
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    EcomstoreApi.instance.ecomstoreServerUrl = settingsProvider.serverUrl;
    try {
      EcomstoreApi.instance.setChannel();
    } catch (e) {
      print("Error in setChannel");
      print(e);
      settingsProvider.changeServerUrl("Error");
    }

    final EcomStoreRepository ecomStoreRepository =
        EcomStoreRepository(ecomstoreApi: EcomstoreApi.instance);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CartProvider(repository: ecomStoreRepository)),
        ChangeNotifierProvider(
            create: (_) => CatalogProvider(repository: ecomStoreRepository)),
        ChangeNotifierProvider(
            create: (_) => FavoriteProvider(repository: ecomStoreRepository))
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
          ShopItemDetails.routeName: (context) => const ShopItemDetails()
        },
        home: const Authenticate(),
      ),
    );
  }
}

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final user = context.watch<User?>();
    return const HomeView();
  }
}
