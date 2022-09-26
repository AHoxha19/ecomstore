import 'package:ecomstore/api/ecomstore_api.dart';
import 'package:ecomstore/models/shopitem.dart';

class EcomStoreRepository {
  const EcomStoreRepository({required EcomstoreApi ecomstoreApi})
      : _ecomstoreApi = ecomstoreApi;

  final EcomstoreApi _ecomstoreApi;

  Future<List<ShopItem>> getShopItems() => _ecomstoreApi.getShopItems();

  Future<void> saveShopItem(ShopItem shopItem) =>
      _ecomstoreApi.saveTodo(shopItem);

  Future<List<ShopItem>> getFavorites() => _ecomstoreApi.getFavoriteShopItems();

  Future<void> removeAllFavorites() => _ecomstoreApi.removeFavorites();

  Future<void> setFavorite(String id, bool value) =>
      _ecomstoreApi.setFavorite(id, value);

  Future<void> deleteShopItem(String id) => _ecomstoreApi.deleteShopItem(id);
}
