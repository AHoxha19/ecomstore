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
      final res = await client.query(QueryOptions(
        document: gql(_queryGetShopItems),
        fetchPolicy: FetchPolicy.noCache,
        // ignore cache data if any
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
      ));
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

  String _mutationAddShopItem = """
  mutation createShopItem(\$shopItem:GraphqlShopItemInput!){
  addShopItem(shopItem: \$shopItem){id}
}
  """;

  Future<bool> addShopItem(ShopItem item) async {
    try {
      final res = await client.mutate(
          MutationOptions(document: gql(_mutationAddShopItem), variables: {
        'shopItem': {
          "name": item.name,
          "imageUrl": item.imageUrl,
          "category": item.category,
          "price": item.price,
          "favorite": item.favorite
        }
      }));
      print(res);

      return true;
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  String _queryFavoriteShopItems = """
  query{
    getAllFavorites{
       id,
      name,
      imageUrl,
      category,
      price,
      favorite
    }
  }
  """;

  Future<List<ShopItem>> getFavoriteShopItems() async {
    try {
      final res = await client.query(QueryOptions(
        document: gql(_queryFavoriteShopItems),
        fetchPolicy: FetchPolicy.noCache,
        // ignore cache data if any
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
      ));
      print("GETTING FAVORITES");
      print(res);
      final shopItems = List<ShopItem>.from(res.data?['getAllFavorites'].map(
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

  String _mutationSetFavorite = """
  mutation (\$id:Int!, \$favorite:Boolean!){
  setFavorite(id: \$id, favorite:\$favorite)
}

  """;

  Future<void> setFavorite(int id, bool value) async {
    try {
      /*final stub = shop_item_grpc.ShopItemsServiceClient(channel);
      await stub.setFavorite(
          shop_item_grpc.SetFavoriteRequest(id: id, favorite: value));*/
      final res = await client.mutate(MutationOptions(
          document: gql(_mutationSetFavorite),
          variables: {'id': id, 'favorite': value}));
      print(res);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  String _mutationRemoveFavorite = """
  mutation{
    deleteAllFavorite
  }
  """;

  Future<void> removeFavorites() async {
    try {
      final res = await client
          .mutate(MutationOptions(document: gql(_mutationRemoveFavorite)));
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
