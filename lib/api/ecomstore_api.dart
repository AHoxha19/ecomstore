import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecomstore/api/shopItem.pbgrpc.dart' as shop_item_grpc;
import 'package:ecomstore/models/shopitem.dart';
import 'package:grpc/grpc.dart';
import 'package:rxdart/rxdart.dart';

class EcomstoreApi {
  //Singleton declaration
  static final EcomstoreApi _ecomstoreApiInstance = EcomstoreApi._internal();
  EcomstoreApi._internal() {
    setChannel();
  }

  static EcomstoreApi get instance => _ecomstoreApiInstance;

  //End Singleton declaration

  String ecomstoreServerUrl = "http://127.0.0.1:5019";

  setChannel() {
    print(int.parse(ecomstoreServerUrl.split(":")[2]));
    print(Uri.parse(ecomstoreServerUrl).host);
    channel = ClientChannel(Uri.parse(ecomstoreServerUrl).host,
        port: Uri.parse(ecomstoreServerUrl).port,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));
  }

  late ClientChannel channel;

  Future<List<ShopItem>> getShopItems() async {
    try {
      final stub = shop_item_grpc.ShopItemsServiceClient(channel);
      final res = await stub.getAllShopItems(shop_item_grpc.Empty());

      final shopItems = List<ShopItem>.from(res.shopItems.map((i) => ShopItem(
          id: i.id,
          name: i.name,
          category: i.category.name,
          imageUrl: i.imageUrl,
          price: i.price,
          favorite: i.favorite)));
      return shopItems;
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<bool> addShopItem(ShopItem item) async {
    try {
      final stub = shop_item_grpc.ShopItemsServiceClient(channel);
      final res = await stub.addShopItem(shop_item_grpc.AddShopItem(
          shopItem: shop_item_grpc.ShopItem(
              id: item.id,
              favorite: item.favorite,
              category: shop_item_grpc.CategoryShopItem.values
                  .where((element) => element.name == item.category)
                  .first,
              imageUrl: item.imageUrl,
              name: item.name,
              price: item.price)));
      print(res);
      return true;
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<List<ShopItem>> getFavoriteShopItems() async {
    try {
      final stub = shop_item_grpc.ShopItemsServiceClient(channel);
      final res = await stub.getAllFavorites(shop_item_grpc.Empty());
      final shopItems = List<ShopItem>.from(res.shopItems.map((i) => ShopItem(
          id: i.id,
          name: i.name,
          category: i.category.name,
          imageUrl: i.imageUrl,
          price: i.price,
          favorite: i.favorite)));
      return shopItems;
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<void> setFavorite(int id, bool value) async {
    try {
      final stub = shop_item_grpc.ShopItemsServiceClient(channel);
      await stub.setFavorite(
          shop_item_grpc.SetFavoriteRequest(id: id, favorite: value));
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<void> removeFavorites() async {
    try {
      final stub = shop_item_grpc.ShopItemsServiceClient(channel);
      await stub.deleteAllFavorite(shop_item_grpc.Empty());
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
