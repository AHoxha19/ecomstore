///
//  Generated code. Do not modify.
//  source: shopItem.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use categoryShopItemDescriptor instead')
const CategoryShopItem$json = const {
  '1': 'CategoryShopItem',
  '2': const [
    const {'1': 'jacket', '2': 0},
    const {'1': 'hat', '2': 1},
    const {'1': 'sneaker', '2': 2},
  ],
};

/// Descriptor for `CategoryShopItem`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List categoryShopItemDescriptor = $convert.base64Decode('ChBDYXRlZ29yeVNob3BJdGVtEgoKBmphY2tldBAAEgcKA2hhdBABEgsKB3NuZWFrZXIQAg==');
@$core.Deprecated('Use addShopItemDescriptor instead')
const AddShopItem$json = const {
  '1': 'AddShopItem',
  '2': const [
    const {'1': 'shopItem', '3': 1, '4': 1, '5': 11, '6': '.ShopItem', '10': 'shopItem'},
  ],
};

/// Descriptor for `AddShopItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addShopItemDescriptor = $convert.base64Decode('CgtBZGRTaG9wSXRlbRIlCghzaG9wSXRlbRgBIAEoCzIJLlNob3BJdGVtUghzaG9wSXRlbQ==');
@$core.Deprecated('Use shopItemDescriptor instead')
const ShopItem$json = const {
  '1': 'ShopItem',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'price', '3': 2, '4': 1, '5': 2, '10': 'price'},
    const {'1': 'imageUrl', '3': 3, '4': 1, '5': 9, '10': 'imageUrl'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'category', '3': 5, '4': 1, '5': 14, '6': '.CategoryShopItem', '10': 'category'},
    const {'1': 'favorite', '3': 6, '4': 1, '5': 8, '10': 'favorite'},
  ],
};

/// Descriptor for `ShopItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopItemDescriptor = $convert.base64Decode('CghTaG9wSXRlbRIOCgJpZBgBIAEoBVICaWQSFAoFcHJpY2UYAiABKAJSBXByaWNlEhoKCGltYWdlVXJsGAMgASgJUghpbWFnZVVybBISCgRuYW1lGAQgASgJUgRuYW1lEi0KCGNhdGVnb3J5GAUgASgOMhEuQ2F0ZWdvcnlTaG9wSXRlbVIIY2F0ZWdvcnkSGgoIZmF2b3JpdGUYBiABKAhSCGZhdm9yaXRl');
@$core.Deprecated('Use shopItemRequestDescriptor instead')
const ShopItemRequest$json = const {
  '1': 'ShopItemRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `ShopItemRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopItemRequestDescriptor = $convert.base64Decode('Cg9TaG9wSXRlbVJlcXVlc3QSDgoCaWQYASABKAVSAmlk');
@$core.Deprecated('Use shopItemsListDescriptor instead')
const ShopItemsList$json = const {
  '1': 'ShopItemsList',
  '2': const [
    const {'1': 'shopItems', '3': 1, '4': 3, '5': 11, '6': '.ShopItem', '10': 'shopItems'},
  ],
};

/// Descriptor for `ShopItemsList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shopItemsListDescriptor = $convert.base64Decode('Cg1TaG9wSXRlbXNMaXN0EicKCXNob3BJdGVtcxgBIAMoCzIJLlNob3BJdGVtUglzaG9wSXRlbXM=');
@$core.Deprecated('Use setFavoriteRequestDescriptor instead')
const SetFavoriteRequest$json = const {
  '1': 'SetFavoriteRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'favorite', '3': 2, '4': 1, '5': 8, '10': 'favorite'},
  ],
};

/// Descriptor for `SetFavoriteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setFavoriteRequestDescriptor = $convert.base64Decode('ChJTZXRGYXZvcml0ZVJlcXVlc3QSDgoCaWQYASABKAVSAmlkEhoKCGZhdm9yaXRlGAIgASgIUghmYXZvcml0ZQ==');
@$core.Deprecated('Use favoriteResultDescriptor instead')
const FavoriteResult$json = const {
  '1': 'FavoriteResult',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `FavoriteResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoriteResultDescriptor = $convert.base64Decode('Cg5GYXZvcml0ZVJlc3VsdBIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
