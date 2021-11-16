import 'package:ecomstore/constants/colors.dart';
import 'package:ecomstore/providers/cart_provider.dart';
import 'package:ecomstore/providers/ecom_provider.dart';
import 'package:ecomstore/views/cart.dart';
import 'package:ecomstore/views/favorite.dart';
import 'package:ecomstore/views/home.dart';
import 'package:ecomstore/views/profile.dart';
import 'package:ecomstore/views/shopitem_details.dart';
import 'package:ecomstore/widgets/ecomstore_scaffold.dart';
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
                ChangeNotifierProvider(create: (_) => EcomProvider()),
                ChangeNotifierProvider(create: (_) => CartProvider())
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
                  ShopItemDetails.routeName: (context) =>
                      const ShopItemDetails()
                },
                home: const EcomstoreHomePage(),
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

class EcomstoreHomePage extends StatefulWidget {
  const EcomstoreHomePage({Key? key}) : super(key: key);

  @override
  State<EcomstoreHomePage> createState() => _EcomstoreHomePageState();
}

class _EcomstoreHomePageState extends State<EcomstoreHomePage> {
  int _selectedIndex = 0;
  late CartProvider cartProvider;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    HomeView(optionStyle: optionStyle),
    FavoriteView(optionStyle: optionStyle),
    CartView(optionStyle: optionStyle),
    ProfileView(optionStyle: optionStyle)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        cartProvider.showBadge = false;
      } else {
        cartProvider.showBadge = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<CartProvider>(context);
    return EcomstoreScaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.cube_box_fill),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.heart_fill,
          ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: cartProvider.showBadge
              ? Badge(
                  badgeContent: Text(
                    "${cartProvider.shopItems.length}",
                    style: TextStyle(color: Colors.white),
                  ),
                  badgeColor: kLogoColor,
                  child: Icon(CupertinoIcons.bag_fill))
              : Icon(
                  CupertinoIcons.bag_fill,
                ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.profile_circled,
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(color: Colors.black),
      unselectedItemColor: Colors.grey[300],
      backgroundColor: Colors.black,
      onTap: _onItemTapped,
    );
  }
}
