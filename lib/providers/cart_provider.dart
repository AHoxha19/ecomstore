import 'package:ecomstore/models/shopitem.dart';
import 'package:ecomstore/repository/ecomstore_repository.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<ShopItem> _cartShopItems = [];

  final EcomStoreRepository ecomstoreRepository;

  CartProvider({required EcomStoreRepository repository})
      : ecomstoreRepository = repository;

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

  Future<void> pay() async {
    try {
      await ecomstoreRepository.removeAllFavorites();
      _cartShopItems.clear();
      notifyListeners();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

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
