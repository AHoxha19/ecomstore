///
//  Generated code. Do not modify.
//  source: shopItem.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class CategoryShopItem extends $pb.ProtobufEnum {
  static const CategoryShopItem jacket = CategoryShopItem._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'jacket');
  static const CategoryShopItem hat = CategoryShopItem._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'hat');
  static const CategoryShopItem sneaker = CategoryShopItem._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'sneaker');

  static const $core.List<CategoryShopItem> values = <CategoryShopItem> [
    jacket,
    hat,
    sneaker,
  ];

  static final $core.Map<$core.int, CategoryShopItem> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CategoryShopItem? valueOf($core.int value) => _byValue[value];

  const CategoryShopItem._($core.int v, $core.String n) : super(v, n);
}

