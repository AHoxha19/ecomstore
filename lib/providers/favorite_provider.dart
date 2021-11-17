import 'package:ecomstore/models/shopitem.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<ShopItem> _favoriteShopItems = [];

  List<ShopItem> get favoriteShopItems => _favoriteShopItems;

  void addToFavorite(ShopItem shopItem) {
    if (!_favoriteShopItems.contains(shopItem)) {
      _favoriteShopItems.add(shopItem);
      notifyListeners();
    }
  }

  void removeFromFavorite(ShopItem shopItem) {
    if (_favoriteShopItems.contains(shopItem)) {
      _favoriteShopItems.remove(shopItem);
      notifyListeners();
    }
  }
}
