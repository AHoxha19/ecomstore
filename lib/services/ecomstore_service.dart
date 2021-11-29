import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomstore/models/shopitem.dart';

class EcomstoreService {
  //Singleton declaration
  static final EcomstoreService _ecomstoreService =
      EcomstoreService._internal();
  EcomstoreService._internal();
  static EcomstoreService get instance => _ecomstoreService;
  //End Singleton declaration

  final shopItemsCollectionName = "shopItems";

  final _firestore = FirebaseFirestore.instance;
  final _shopItemsCollection =
      FirebaseFirestore.instance.collection("shopItems");

  Stream<List<ShopItem>> streamShopItems() {
    var ref = _firestore.collection(shopItemsCollectionName);
    return ref.snapshots().map((list) =>
        list.docs.map((doc) => ShopItem.fromJson(doc.data())).toList());
  }

  Future<List<ShopItem>> getShopItemsFromFirebase() async {
    final shopItems =
        await _firestore.collection(shopItemsCollectionName).get();
    if (shopItems == null) return [];
    return shopItems.docs.map((e) => ShopItem.fromJson(e.data())).toList();
  }

  Future<void> setFavorite(ShopItem shopItem) async {
    await _shopItemsCollection.doc(shopItem.id).update(shopItem.toJson());
  }

  Future<void> removeFavorites(List<ShopItem> shopItems) async {
    if (shopItems.isEmpty) return;
    for (var s in shopItems) {
      s.favorite = false;
      await setFavorite(s);
    }
  }
}
