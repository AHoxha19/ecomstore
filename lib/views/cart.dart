import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/providers/cart_provider.dart';
import 'package:ecomstore/providers/ecom_provider.dart';
import 'package:ecomstore/widgets/payment_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cartProvider = Provider.of<CartProvider>(context);
    final ecomProvider = Provider.of<EcomProvider>(context);
    final double total = cartProvider.shopItems.fold(
        0, (num prev, element) => prev + element.quantity * element.price);

    if (cartProvider.shopItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.bag_badge_minus,
              size: height * 0.2,
              color: Colors.black.withOpacity(0.2),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "No item in cart",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.2),
                  fontSize: height * 0.03),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: cartProvider.shopItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading:
                          Image.network(cartProvider.shopItems[index].imageUrl),
                      title: Text("${cartProvider.shopItems[index].name}"),
                      subtitle: Text(
                          "${cartProvider.shopItems[index].price} CHF x ${cartProvider.shopItems[index].quantity}"),
                      trailing: IconButton(
                        onPressed: () {
                          cartProvider
                              .removeFromCart(cartProvider.shopItems[index]);
                        },
                        icon: Icon(CupertinoIcons.clear_circled),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            width: double.infinity,
            height: height * 0.06,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () {},
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "Total: ",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                      text: "${total} CHF",
                      style: TextStyle(color: kTotalColor))
                ]))),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          SizedBox(
              width: double.infinity,
              height: height * 0.06,
              child: ElevatedButton(
                  onPressed: () {
                    //Remove all items in favorite
                    showDialog(
                        context: context,
                        builder: (context) {
                          return PaymentDialog(
                              total: total,
                              content: Container(
                                height: height * 0.2,
                                width: width * 0.2,
                                child: ListView(
                                  children: cartProvider.shopItems
                                      .map((s) => ListTile(
                                            title: Text(s.name),
                                            trailing:
                                                Text("${s.price * s.quantity}"),
                                          ))
                                      .toList(),
                                ),
                              ),
                              onPay: () async {
                                await ecomProvider
                                    .removeFavorites(cartProvider.shopItems);
                                cartProvider.pay();
                              });
                        });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kLogoColor)),
                  child: Text(
                    "Checkout",
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }
}
