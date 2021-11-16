class ShopItem {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  int quantity = 1;

  ShopItem(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price});

  ShopItem.fromJson(Map<String, Object?> json)
      : this(
            name: json['name']! as String,
            category: json['category']! as String,
            imageUrl: json['imageUrl']! as String,
            price: (json['price']! as int).toDouble());

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'category': category,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }

  @override
  bool operator ==(Object other) {
    if (other is ShopItem) {
      return other.name == name;
    } else {
      return false;
    }
  }
}
