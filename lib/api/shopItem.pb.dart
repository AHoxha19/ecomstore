///
//  Generated code. Do not modify.
//  source: shopItem.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'shopItem.pbenum.dart';

export 'shopItem.pbenum.dart';

class AddShopItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddShopItem', createEmptyInstance: create)
    ..aOM<ShopItem>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shopItem', protoName: 'shopItem', subBuilder: ShopItem.create)
    ..hasRequiredFields = false
  ;

  AddShopItem._() : super();
  factory AddShopItem({
    ShopItem? shopItem,
  }) {
    final _result = create();
    if (shopItem != null) {
      _result.shopItem = shopItem;
    }
    return _result;
  }
  factory AddShopItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddShopItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddShopItem clone() => AddShopItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddShopItem copyWith(void Function(AddShopItem) updates) => super.copyWith((message) => updates(message as AddShopItem)) as AddShopItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddShopItem create() => AddShopItem._();
  AddShopItem createEmptyInstance() => create();
  static $pb.PbList<AddShopItem> createRepeated() => $pb.PbList<AddShopItem>();
  @$core.pragma('dart2js:noInline')
  static AddShopItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddShopItem>(create);
  static AddShopItem? _defaultInstance;

  @$pb.TagNumber(1)
  ShopItem get shopItem => $_getN(0);
  @$pb.TagNumber(1)
  set shopItem(ShopItem v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasShopItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearShopItem() => clearField(1);
  @$pb.TagNumber(1)
  ShopItem ensureShopItem() => $_ensure(0);
}

class ShopItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ShopItem', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OF)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageUrl', protoName: 'imageUrl')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..e<CategoryShopItem>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'category', $pb.PbFieldType.OE, defaultOrMaker: CategoryShopItem.jacket, valueOf: CategoryShopItem.valueOf, enumValues: CategoryShopItem.values)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..hasRequiredFields = false
  ;

  ShopItem._() : super();
  factory ShopItem({
    $core.int? id,
    $core.double? price,
    $core.String? imageUrl,
    $core.String? name,
    CategoryShopItem? category,
    $core.bool? favorite,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (price != null) {
      _result.price = price;
    }
    if (imageUrl != null) {
      _result.imageUrl = imageUrl;
    }
    if (name != null) {
      _result.name = name;
    }
    if (category != null) {
      _result.category = category;
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    return _result;
  }
  factory ShopItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShopItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShopItem clone() => ShopItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShopItem copyWith(void Function(ShopItem) updates) => super.copyWith((message) => updates(message as ShopItem)) as ShopItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopItem create() => ShopItem._();
  ShopItem createEmptyInstance() => create();
  static $pb.PbList<ShopItem> createRepeated() => $pb.PbList<ShopItem>();
  @$core.pragma('dart2js:noInline')
  static ShopItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShopItem>(create);
  static ShopItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get price => $_getN(1);
  @$pb.TagNumber(2)
  set price($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get imageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set imageUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearImageUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  CategoryShopItem get category => $_getN(4);
  @$pb.TagNumber(5)
  set category(CategoryShopItem v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCategory() => $_has(4);
  @$pb.TagNumber(5)
  void clearCategory() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get favorite => $_getBF(5);
  @$pb.TagNumber(6)
  set favorite($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFavorite() => $_has(5);
  @$pb.TagNumber(6)
  void clearFavorite() => clearField(6);
}

class ShopItemRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ShopItemRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ShopItemRequest._() : super();
  factory ShopItemRequest({
    $core.int? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory ShopItemRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShopItemRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShopItemRequest clone() => ShopItemRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShopItemRequest copyWith(void Function(ShopItemRequest) updates) => super.copyWith((message) => updates(message as ShopItemRequest)) as ShopItemRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopItemRequest create() => ShopItemRequest._();
  ShopItemRequest createEmptyInstance() => create();
  static $pb.PbList<ShopItemRequest> createRepeated() => $pb.PbList<ShopItemRequest>();
  @$core.pragma('dart2js:noInline')
  static ShopItemRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShopItemRequest>(create);
  static ShopItemRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class ShopItemsList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ShopItemsList', createEmptyInstance: create)
    ..pc<ShopItem>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shopItems', $pb.PbFieldType.PM, protoName: 'shopItems', subBuilder: ShopItem.create)
    ..hasRequiredFields = false
  ;

  ShopItemsList._() : super();
  factory ShopItemsList({
    $core.Iterable<ShopItem>? shopItems,
  }) {
    final _result = create();
    if (shopItems != null) {
      _result.shopItems.addAll(shopItems);
    }
    return _result;
  }
  factory ShopItemsList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShopItemsList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShopItemsList clone() => ShopItemsList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShopItemsList copyWith(void Function(ShopItemsList) updates) => super.copyWith((message) => updates(message as ShopItemsList)) as ShopItemsList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopItemsList create() => ShopItemsList._();
  ShopItemsList createEmptyInstance() => create();
  static $pb.PbList<ShopItemsList> createRepeated() => $pb.PbList<ShopItemsList>();
  @$core.pragma('dart2js:noInline')
  static ShopItemsList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShopItemsList>(create);
  static ShopItemsList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ShopItem> get shopItems => $_getList(0);
}

class SetFavoriteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetFavoriteRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..hasRequiredFields = false
  ;

  SetFavoriteRequest._() : super();
  factory SetFavoriteRequest({
    $core.int? id,
    $core.bool? favorite,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    return _result;
  }
  factory SetFavoriteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetFavoriteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetFavoriteRequest clone() => SetFavoriteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetFavoriteRequest copyWith(void Function(SetFavoriteRequest) updates) => super.copyWith((message) => updates(message as SetFavoriteRequest)) as SetFavoriteRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetFavoriteRequest create() => SetFavoriteRequest._();
  SetFavoriteRequest createEmptyInstance() => create();
  static $pb.PbList<SetFavoriteRequest> createRepeated() => $pb.PbList<SetFavoriteRequest>();
  @$core.pragma('dart2js:noInline')
  static SetFavoriteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetFavoriteRequest>(create);
  static SetFavoriteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get favorite => $_getBF(1);
  @$pb.TagNumber(2)
  set favorite($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFavorite() => $_has(1);
  @$pb.TagNumber(2)
  void clearFavorite() => clearField(2);
}

class FavoriteResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FavoriteResult', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  FavoriteResult._() : super();
  factory FavoriteResult({
    $core.String? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory FavoriteResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FavoriteResult clone() => FavoriteResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FavoriteResult copyWith(void Function(FavoriteResult) updates) => super.copyWith((message) => updates(message as FavoriteResult)) as FavoriteResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FavoriteResult create() => FavoriteResult._();
  FavoriteResult createEmptyInstance() => create();
  static $pb.PbList<FavoriteResult> createRepeated() => $pb.PbList<FavoriteResult>();
  @$core.pragma('dart2js:noInline')
  static FavoriteResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteResult>(create);
  static FavoriteResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Empty', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

