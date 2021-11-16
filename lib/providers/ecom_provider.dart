import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomstore/models/shopitem.dart';
import 'package:flutter/cupertino.dart';

class EcomProvider extends ChangeNotifier {
  final SHOPITEMS_COLLECTION_NAME = "shopItems";
  final CATEGORY_JACKET = "jacket";
  final CATEGORY_HAT = "hat";
  final CATEGORY_SNEAKER = "sneaker";

  List<ShopItem> _shopItems = [];

  final _firestore = FirebaseFirestore.instance;

  List<ShopItem> getShopItems() {
    return _shopItems;
  }

  Future<List<ShopItem>> getShopItemsFromFirebase() async {
    final shopItems =
        await _firestore.collection(SHOPITEMS_COLLECTION_NAME).get();
    if (shopItems == null) return [];
    _shopItems =
        shopItems.docs.map((e) => ShopItem.fromJson(e.data())).toList();
    return _shopItems;
  }

  List<ShopItem> getAllJackets() {
    return _shopItems.where((s) => s.category == CATEGORY_JACKET).toList();
  }

  List<ShopItem> getAllSneakers() {
    return _shopItems.where((s) => s.category == CATEGORY_SNEAKER).toList();
  }

  List<ShopItem> getAllHats() {
    return _shopItems.where((s) => s.category == CATEGORY_HAT).toList();
  }
}
