import 'package:badges/badges.dart';
import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/providers/cart_provider.dart';
import 'package:ecomstore/views/profile.dart';
import 'package:ecomstore/views/settings.dart';
import 'package:ecomstore/widgets/ecomstore_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'catalog.dart';
import 'favorite.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = '/home';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  late CartProvider cartProvider;

  final List<Widget> _widgetOptions = <Widget>[
    const CatalogView(),
    const FavoriteView(),
    const CartView(),
    const SettingsView()
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
        const BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.cube_box_fill),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
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
                    style: const TextStyle(color: Colors.white),
                  ),
                  badgeColor: kLogoColor,
                  child: const Icon(CupertinoIcons.bag_fill))
              : const Icon(
                  CupertinoIcons.bag_fill,
                ),
          label: 'Cart',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.settings,
          ),
          label: 'Settings',
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
