import 'package:ecomstore/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({
    Key? key,
    required this.optionStyle,
  }) : super(key: key);

  final TextStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return ListView.builder(
        itemCount: cartProvider.shopItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(cartProvider.shopItems[index].imageUrl),
            title: Text("${cartProvider.shopItems[index].name}"),
            subtitle: Text("${cartProvider.shopItems[index].price} CHF"),
          );
        });
  }
}
