import 'package:ecomstore/models/shopitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<ShopItem> _cartShopItems = [];

  void addToFavorite(ShopItem shopItem) {
    _cartShopItems.add(shopItem);
    notifyListeners();
  }

  void removeFromFavorite(ShopItem shopItem) {
    if (_cartShopItems.contains(shopItem)) {
      _cartShopItems.remove(shopItem);
      notifyListeners();
    }
  }
}
