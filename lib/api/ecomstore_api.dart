import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecomstore/models/shopitem.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rxdart/rxdart.dart';

class EcomstoreApi {
  //Singleton declaration
  static final EcomstoreApi _ecomstoreApiInstance = EcomstoreApi._internal();
  EcomstoreApi._internal() {
    setServerUrl();
  }

  static EcomstoreApi get instance => _ecomstoreApiInstance;

  //End Singleton declaration

  String ecomstoreServerUrl = "http://127.0.0.1:5019";
  late GraphQLClient client;

  setServerUrl() {
/*    print(int.parse(ecomstoreServerUrl.split(":")[2]));
    print(Uri.parse(ecomstoreServerUrl).host);

    Uri.parse(ecomstoreServerUrl).host;
    Uri.parse(ecomstoreServerUrl).port;*/

    client = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(ecomstoreServerUrl),
    );
  }

  String _queryGetShopItems = """
  query{
    getAllShopItems{
       id,
      name,
      imageUrl,
      category,
      price,
      favorite
    }
  }
  """;

  Future<List<ShopItem>> getShopItems() async {
    try {
      final res =
          await client.query(QueryOptions(document: gql(_queryGetShopItems)));
      print(res);
      final shopItems = List<ShopItem>.from(res.data?['getAllShopItems'].map(
          (i) => ShopItem(
              id: int.parse(i['id']!),
              name: i['name']! as String,
              category: i['category']! as String,
              imageUrl: i['imageUrl']! as String,
              price: ShopItem.convertToDouble(i['price']!),
              favorite: i['favorite']! as bool)));
      return shopItems;
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<bool> addShopItem(ShopItem item) async {
    try {
      return true;
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<List<ShopItem>> getFavoriteShopItems() async {
    try {
      /* final stub = shop_item_grpc.ShopItemsServiceClient(channel);
      final res = await stub.getAllFavorites(shop_item_grpc.Empty());
      final shopItems = List<ShopItem>.from(res.shopItems.map((i) => ShopItem(
          id: i.id,
          name: i.name,
          category: i.category.name,
          imageUrl: i.imageUrl,
          price: i.price,
          favorite: i.favorite)));
      return shopItems;*/
      return [];
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<void> setFavorite(int id, bool value) async {
    try {
      /*final stub = shop_item_grpc.ShopItemsServiceClient(channel);
      await stub.setFavorite(
          shop_item_grpc.SetFavoriteRequest(id: id, favorite: value));*/
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<void> removeFavorites() async {
    try {
      /*final stub = shop_item_grpc.ShopItemsServiceClient(channel);
      await stub.deleteAllFavorite(shop_item_grpc.Empty());*/
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
