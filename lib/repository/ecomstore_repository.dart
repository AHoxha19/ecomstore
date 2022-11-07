import 'package:ecomstore/api/ecomstore_api.dart';
import 'package:ecomstore/models/shopitem.dart';

class EcomStoreRepository {
  const EcomStoreRepository({required EcomstoreApi ecomstoreApi})
      : _ecomstoreApi = ecomstoreApi;

  final EcomstoreApi _ecomstoreApi;

  Future<List<ShopItem>> getShopItems() => _ecomstoreApi.getShopItems();

  Future<bool> addShopItem(ShopItem item) => _ecomstoreApi.addShopItem(item);

  Future<List<ShopItem>> getFavorites() => _ecomstoreApi.getFavoriteShopItems();

  Future<void> removeAllFavorites() => _ecomstoreApi.removeFavorites();

  Future<void> setFavorite(int id, bool value) =>
      _ecomstoreApi.setFavorite(id, value);
}
