import 'package:ecomstore/models/shopitem.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<ShopItem> _cartShopItems = [];

  bool _showBadge = false;
  bool get showBadge => _showBadge;

  set showBadge(bool value) {
    if (value && shopItems.isNotEmpty) {
      _showBadge = true;
    } else {
      _showBadge = false;
    }
  }

  List<ShopItem> get shopItems => _cartShopItems;

  void addToCart(ShopItem shopItem) {
    if (!_cartShopItems.contains(shopItem)) {
      _cartShopItems.add(shopItem);
      _showBadge = true;
      notifyListeners();
    }
  }

  void removeFromCart(ShopItem shopItem) {
    if (_cartShopItems.contains(shopItem)) {
      _cartShopItems.remove(shopItem);
      notifyListeners();
    }
    if (_cartShopItems.isEmpty) {
      _showBadge = false;
    }
  }
}
