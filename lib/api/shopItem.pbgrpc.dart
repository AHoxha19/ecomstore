///
//  Generated code. Do not modify.
//  source: shopItem.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'shopItem.pb.dart' as $0;
export 'shopItem.pb.dart';

class ShopItemsServiceClient extends $grpc.Client {
  static final _$addShopItem = $grpc.ClientMethod<$0.AddShopItem, $0.ShopItem>(
      '/ShopItemsService/addShopItem',
      ($0.AddShopItem value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ShopItem.fromBuffer(value));
  static final _$getShopItem =
      $grpc.ClientMethod<$0.ShopItemRequest, $0.ShopItem>(
          '/ShopItemsService/getShopItem',
          ($0.ShopItemRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ShopItem.fromBuffer(value));
  static final _$getAllShopItems =
      $grpc.ClientMethod<$0.Empty, $0.ShopItemsList>(
          '/ShopItemsService/getAllShopItems',
          ($0.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ShopItemsList.fromBuffer(value));
  static final _$setFavorite =
      $grpc.ClientMethod<$0.SetFavoriteRequest, $0.FavoriteResult>(
          '/ShopItemsService/setFavorite',
          ($0.SetFavoriteRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.FavoriteResult.fromBuffer(value));
  static final _$getAllFavorites =
      $grpc.ClientMethod<$0.Empty, $0.ShopItemsList>(
          '/ShopItemsService/getAllFavorites',
          ($0.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ShopItemsList.fromBuffer(value));
  static final _$deleteAllFavorite =
      $grpc.ClientMethod<$0.Empty, $0.FavoriteResult>(
          '/ShopItemsService/deleteAllFavorite',
          ($0.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.FavoriteResult.fromBuffer(value));

  ShopItemsServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ShopItem> addShopItem($0.AddShopItem request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addShopItem, request, options: options);
  }

  $grpc.ResponseFuture<$0.ShopItem> getShopItem($0.ShopItemRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getShopItem, request, options: options);
  }

  $grpc.ResponseFuture<$0.ShopItemsList> getAllShopItems($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllShopItems, request, options: options);
  }

  $grpc.ResponseFuture<$0.FavoriteResult> setFavorite(
      $0.SetFavoriteRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setFavorite, request, options: options);
  }

  $grpc.ResponseFuture<$0.ShopItemsList> getAllFavorites($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllFavorites, request, options: options);
  }

  $grpc.ResponseFuture<$0.FavoriteResult> deleteAllFavorite($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteAllFavorite, request, options: options);
  }
}

abstract class ShopItemsServiceBase extends $grpc.Service {
  $core.String get $name => 'ShopItemsService';

  ShopItemsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AddShopItem, $0.ShopItem>(
        'addShopItem',
        addShopItem_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddShopItem.fromBuffer(value),
        ($0.ShopItem value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ShopItemRequest, $0.ShopItem>(
        'getShopItem',
        getShopItem_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ShopItemRequest.fromBuffer(value),
        ($0.ShopItem value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.ShopItemsList>(
        'getAllShopItems',
        getAllShopItems_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.ShopItemsList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetFavoriteRequest, $0.FavoriteResult>(
        'setFavorite',
        setFavorite_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SetFavoriteRequest.fromBuffer(value),
        ($0.FavoriteResult value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.ShopItemsList>(
        'getAllFavorites',
        getAllFavorites_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.ShopItemsList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.FavoriteResult>(
        'deleteAllFavorite',
        deleteAllFavorite_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.FavoriteResult value) => value.writeToBuffer()));
  }

  $async.Future<$0.ShopItem> addShopItem_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AddShopItem> request) async {
    return addShopItem(call, await request);
  }

  $async.Future<$0.ShopItem> getShopItem_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ShopItemRequest> request) async {
    return getShopItem(call, await request);
  }

  $async.Future<$0.ShopItemsList> getAllShopItems_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getAllShopItems(call, await request);
  }

  $async.Future<$0.FavoriteResult> setFavorite_Pre($grpc.ServiceCall call,
      $async.Future<$0.SetFavoriteRequest> request) async {
    return setFavorite(call, await request);
  }

  $async.Future<$0.ShopItemsList> getAllFavorites_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getAllFavorites(call, await request);
  }

  $async.Future<$0.FavoriteResult> deleteAllFavorite_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return deleteAllFavorite(call, await request);
  }

  $async.Future<$0.ShopItem> addShopItem(
      $grpc.ServiceCall call, $0.AddShopItem request);
  $async.Future<$0.ShopItem> getShopItem(
      $grpc.ServiceCall call, $0.ShopItemRequest request);
  $async.Future<$0.ShopItemsList> getAllShopItems(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.FavoriteResult> setFavorite(
      $grpc.ServiceCall call, $0.SetFavoriteRequest request);
  $async.Future<$0.ShopItemsList> getAllFavorites(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.FavoriteResult> deleteAllFavorite(
      $grpc.ServiceCall call, $0.Empty request);
}
