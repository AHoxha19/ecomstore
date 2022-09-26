import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:ecomstore/models/shopitem.dart';
import 'package:rxdart/rxdart.dart';

class EcomstoreApi {
  //Singleton declaration
  static final EcomstoreApi _ecomstoreApiInstance = EcomstoreApi._internal();
  EcomstoreApi._internal();

  static EcomstoreApi get instance => _ecomstoreApiInstance;

  //End Singleton declaration

  final _dio = Dio();
  late String ecomstoreServerUrl;

  final _shopItemStreamController = BehaviorSubject<List<ShopItem>>();

  final List<ShopItem> _shopItems = [];

  Future<List<ShopItem>> getShopItems() async {
    try {
      final res = await _dio.get('$ecomstoreServerUrl/shopitems');
      final shopItems =
          List<ShopItem>.from(res.data.map((i) => ShopItem.fromJson(i)));
      print(shopItems);
      print(shopItems is List<ShopItem>);
      return shopItems;
    } on DioError catch (e) {
      throw Exception("HTTP Error: ${e.error}, message: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<List<ShopItem>> getFavoriteShopItems() async {
    try {
      final res = await _dio.get('$ecomstoreServerUrl/shopitems/favorites');
      print(res.data);
      final shopItems =
          List<ShopItem>.from(res.data.map((i) => ShopItem.fromJson(i)));
      return shopItems;
    } on DioError catch (e) {
      throw Exception("HTTP Error: ${e.error}, message: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<void> setFavorite(String id, bool value) async {
    try {
      final res = await _dio.put("$ecomstoreServerUrl/shopitems/$id/favorite",
          data: jsonEncode({"favorite": value}));
      print(res);
    } on DioError catch (e) {
      throw Exception("HTTP Error: ${e.error}, message: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<void> removeFavorites() async {
    try {
      final res = await _dio.delete("$ecomstoreServerUrl/shopitems/favorites");
    } on DioError catch (e) {
      throw Exception("HTTP Error: ${e.error}, message: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<void> deleteShopItem(String id) async {
    final todos = [..._shopItemStreamController.value];
    todos.removeWhere((t) => t.id == id);
    _shopItemStreamController.add(todos);
  }

  Future<void> saveTodo(ShopItem shopItem) async {
    final todos = [..._shopItemStreamController.value];
    final todoIndex = todos.indexWhere((t) => t.id == shopItem.id);
    if (todoIndex >= 0) {
      todos[todoIndex] = shopItem;
    } else {
      todos.add(shopItem);
    }
    _shopItemStreamController.add(todos);
  }
}
