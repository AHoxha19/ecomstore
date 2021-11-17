class ShopItem {
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  bool favorite;
  int quantity = 1;

  ShopItem(
      {required this.id,
      required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.favorite});

  ShopItem.fromJson(Map<String, Object?> json)
      : this(
            id: json['id']! as String,
            name: json['name']! as String,
            category: json['category']! as String,
            imageUrl: json['imageUrl']! as String,
            price: convertToDouble(json['price']!),
            favorite: json['favorite']! as bool);

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'imageUrl': imageUrl,
      'price': price,
      'favorite': favorite,
    };
  }

  static double convertToDouble(Object jsonPrice) {
    if (jsonPrice is int) {
      return jsonPrice.toDouble();
    } else if (jsonPrice is double) {
      return jsonPrice;
    }
    return 0.0;
  }

  @override
  bool operator ==(Object other) {
    if (other is ShopItem) {
      return other.name == name;
    } else {
      return false;
    }
  }

  @override
  String toString() {
    return 'ShopItem{' +
        ' id: $id,' +
        ' name: $name,' +
        ' category: $category,' +
        ' imageUrl: $imageUrl,' +
        ' price: $price,' +
        ' favorite: $favorite,' +
        ' quantity: $quantity,' +
        '}';
  }
}
