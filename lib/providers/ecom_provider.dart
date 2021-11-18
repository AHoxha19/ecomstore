import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomstore/models/shopitem.dart';
import 'package:flutter/cupertino.dart';

class EcomProvider extends ChangeNotifier {
  final SHOPITEMS_COLLECTION_NAME = "shopItems";
  final CATEGORY_JACKET = "jacket";
  final CATEGORY_HAT = "hat";
  final CATEGORY_SNEAKER = "sneaker";
  final shopItemsCollection =
      FirebaseFirestore.instance.collection("shopItems");

  List<ShopItem> _shopItems = [];

  final _firestore = FirebaseFirestore.instance;

  List<ShopItem> getShopItems() {
    return _shopItems;
  }

  Stream<List<ShopItem>> streamShopItems() {
    var ref = _firestore.collection(SHOPITEMS_COLLECTION_NAME);
    return ref.snapshots().map((list) =>
        list.docs.map((doc) => ShopItem.fromJson(doc.data())).toList());
  }

  Future<List<ShopItem>> getShopItemsFromFirebase() async {
    final shopItems =
        await _firestore.collection(SHOPITEMS_COLLECTION_NAME).get();
    print(shopItems.docs.last.data());
    if (shopItems == null) return [];
    _shopItems =
        shopItems.docs.map((e) => ShopItem.fromJson(e.data())).toList();
    print("Shop items");
    print(_shopItems);
    return _shopItems;
  }

  Future<void> setFavorite(ShopItem shopItem) async {
    print("ShopItem to update");
    print(shopItem);
    print(shopItem.id);
    await shopItemsCollection.doc(shopItem.id).update(shopItem.toJson());
    return;
  }

  Future<void> removeFavorites(List<ShopItem> shopItems) async {
    if (shopItems.isEmpty) return;
    for (var s in shopItems) {
      s.favorite = false;
      await setFavorite(s);
    }
  }

  List<ShopItem> getFavorites() {
    return _shopItems.where((s) => s.favorite).toList();
  }
}
