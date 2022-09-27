import 'package:ecomstore/api/ecomstore_api.dart';
import 'package:ecomstore/models/shopitem.dart';
import 'package:ecomstore/providers/cart_provider.dart';
import 'package:ecomstore/repository/ecomstore_repository.dart';
import 'package:flutter/material.dart';

enum CatalogStatus { initial, loading, success, error }

class CatalogProvider with ChangeNotifier {
  List<ShopItem> _notFilteredCatalogShopItems = [];
  List<ShopItem> catalogShopItems = [];

  String errorMessage = "There was an error fetching shopItems";

  final EcomStoreRepository ecomstoreRepository;

  CatalogStatus status = CatalogStatus.initial;

  ShopItem shopItemToAdd = ShopItem.empty();

  CatalogProvider({required EcomStoreRepository repository})
      : ecomstoreRepository = repository {
    initCatalog();
  }

  void initCatalog() async {
    status = CatalogStatus.loading;
    notifyListeners();
    await getShopItems();
  }

  getShopItems() async {
    try {
      catalogShopItems = await ecomstoreRepository.getShopItems();
      _notFilteredCatalogShopItems = catalogShopItems;
      status = CatalogStatus.success;
      notifyListeners();
    } catch (error, stack) {
      print("Error getting data: $error");
      status = CatalogStatus.error;
      errorMessage =
          "There was an error fetching shopItems: ${error.toString()}";
      notifyListeners();
    }
  }

  addShopItem() async {
    try {
      await ecomstoreRepository.addShopItem(shopItemToAdd);
      shopItemToAdd = ShopItem.empty();
      status = CatalogStatus.initial;
      notifyListeners();
    } catch (error, stack) {
      print("Error getting data: $error");
      status = CatalogStatus.error;
      errorMessage =
          "There was an error adding a shopItem: ${error.toString()}";
      notifyListeners();
    }
  }

  void filterShopItems(String category) {
    print("coming in filter");
    switch (category) {
      case "All":
        catalogShopItems = _notFilteredCatalogShopItems;
        notifyListeners();
        break;
      case "Hat":
        catalogShopItems = _notFilteredCatalogShopItems
            .where((s) => s.category == "hat")
            .toList();
        notifyListeners();
        break;
      case "Jacket":
        catalogShopItems = _notFilteredCatalogShopItems
            .where((s) => s.category == "jacket")
            .toList();
        notifyListeners();
        break;
      case "Sneaker":
        catalogShopItems = _notFilteredCatalogShopItems
            .where((s) => s.category == "sneaker")
            .toList();
        notifyListeners();
        break;
    }
  }
}
