import 'package:dio/dio.dart';
import 'package:ecomstore/api/ecomstore_api.dart';
import 'package:ecomstore/models/shopitem.dart';
import 'package:ecomstore/providers/cart_provider.dart';
import 'package:ecomstore/repository/ecomstore_repository.dart';
import 'package:flutter/material.dart';

enum FavoriteStatus { initial, loading, success, error }

class FavoriteProvider with ChangeNotifier {
  List<ShopItem> favoriteShopItems = [];
  String errorMessage = "There was an error fetching favorites";

  final EcomStoreRepository ecomstoreRepository;

  FavoriteStatus status = FavoriteStatus.initial;

  FavoriteProvider({required EcomStoreRepository repository})
      : ecomstoreRepository = repository {
    initCatalog();
  }

  void initCatalog() async {
    status = FavoriteStatus.loading;
    notifyListeners();
    await getFavorites();
  }

  getFavorites() async {
    try {
      favoriteShopItems = await ecomstoreRepository.getFavorites();
      status = FavoriteStatus.success;
      notifyListeners();
    } catch (error, stack) {
      print("Error getting data: $error");
      status = FavoriteStatus.error;
      errorMessage =
          "There was an error fetching shopItems: ${error.toString()}";
      notifyListeners();
    }
  }

  setFavorite(int id, bool favorite) async {
    try {
      await ecomstoreRepository.setFavorite(id, favorite);
      await getFavorites();
    } catch (e) {
      status = FavoriteStatus.error;
      notifyListeners();
    }
  }
}
