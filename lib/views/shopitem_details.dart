import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/models/shopitem.dart';
import 'package:ecomstore/providers/cart_provider.dart';
import 'package:ecomstore/providers/ecom_provider.dart';
import 'package:ecomstore/widgets/ecomstore_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopItemDetails extends StatefulWidget {
  const ShopItemDetails({
    Key? key,
  }) : super(key: key);

  static const routeName = '/shopItemDetails';

  @override
  State<ShopItemDetails> createState() => _ShopItemDetailsState();
}

class _ShopItemDetailsState extends State<ShopItemDetails> {
  late CartProvider cartProvider;
  late EcomProvider ecomProvider;

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<CartProvider>(context);
    ecomProvider = Provider.of<EcomProvider>(context);
    return EcomstoreScaffold(body: buildShopItemDetailsWidget(context));
  }

  List<bool> isSelected = [true, false, false, false];

  final double iconSize = 40.0;
  Icon heartIcon = Icon(
    CupertinoIcons.heart,
    size: 40.0,
  );

  void setIconFavorite() {
    heartIcon = Icon(
      CupertinoIcons.heart_fill,
      color: Colors.red,
      size: iconSize,
    );
  }

  void unsetIconFavorite() {
    heartIcon = Icon(
      CupertinoIcons.heart,
      size: iconSize,
    );
  }

  buildShopItemDetailsWidget(context) {
    //the container takes the space available
    final height = MediaQuery.of(context).size.height;
    final shopItem = ModalRoute.of(context)!.settings.arguments as ShopItem;

    shopItem.favorite ? setIconFavorite() : unsetIconFavorite();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(shopItem.imageUrl), fit: BoxFit.fill),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          shopItem.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03),
                        ),
                        GestureDetector(
                            onTap: () {
                              bool tmp = shopItem.favorite;
                              shopItem.favorite = !shopItem.favorite;
                              ecomProvider.setFavorite(shopItem).then((_) {
                                if (heartIcon.icon == CupertinoIcons.heart) {
                                  setIconFavorite();
                                  shopItem.favorite = true;
                                  //favoriteProvider.addToFavorite(shopItem);
                                } else {
                                  unsetIconFavorite();
                                  shopItem.favorite = false;
                                  //favoriteProvider.removeFromFavorite(shopItem);
                                }

                                setState(() {});
                              }).catchError((error) {
                                shopItem.favorite = tmp;
                              });
                            },
                            child: heartIcon)
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                      "Yeezy Boost is a hybrid sneaker/bootie/clog shoe from Adidas, introduced as a fashion item first and a sporting item second. Its first official release was on December 28th, 2016, yielding a large social media following, as well as a strict demand for places to buy them"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  child: Text(
                    "${shopItem.price.toString()} CHF",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: height * 0.02),
                  ),
                ),
                Divider(
                  color: kLogoColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Color",
                        style: TextStyle(fontSize: height * 0.025),
                      ),
                      ToggleButtons(
                        children: [
                          Container(
                            decoration: isSelected[0]
                                ? BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: kFirstShopItemColor,
                                    ),
                                  )
                                : null,
                            child: isSelected[0]
                                ? CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      backgroundColor: kFirstShopItemColor,
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundColor: kFirstShopItemColor,
                                    foregroundColor: Colors.white,
                                  ),
                          ),
                          Container(
                            decoration: isSelected[1]
                                ? BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: kSecondShopItemColor,
                                    ),
                                  )
                                : null,
                            child: isSelected[1]
                                ? CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      backgroundColor: kSecondShopItemColor,
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundColor: kSecondShopItemColor,
                                  ),
                          ),
                          Container(
                            decoration: isSelected[2]
                                ? BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: kThirdShopItemColor),
                                  )
                                : null,
                            child: isSelected[2]
                                ? CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      backgroundColor: kThirdShopItemColor,
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundColor: kThirdShopItemColor,
                                  ),
                          ),
                          Container(
                            decoration: isSelected[3]
                                ? BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: kFourthShopItemColor),
                                  )
                                : null,
                            child: isSelected[3]
                                ? CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      backgroundColor: kFourthShopItemColor,
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundColor: kFourthShopItemColor,
                                  ),
                          ),
                        ],
                        renderBorder: false,
                        isSelected: isSelected,
                        onPressed: (int index) {
                          setState(() {
                            for (int buttonIndex = 0;
                                buttonIndex < isSelected.length;
                                buttonIndex++) {
                              if (buttonIndex == index) {
                                isSelected[buttonIndex] = true;
                              } else {
                                isSelected[buttonIndex] = false;
                              }
                            }
                          });
                          print("index is: $index");
                          print(isSelected[index]);
                          setState(() {});
                          print(isSelected);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Divider(
                  color: kLogoColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Quantity",
                        style: TextStyle(fontSize: height * 0.025),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      colorLogo[100])),
                              onPressed: () {
                                if (shopItem.quantity == 1) return;
                                setState(() {
                                  shopItem.quantity -= 1;
                                });
                              },
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              onPressed: null,
                              child: Text(
                                shopItem.quantity.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      colorLogo[100])),
                              onPressed: () {
                                setState(() {
                                  shopItem.quantity += 1;
                                });
                              },
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Divider(
                  color: kLogoColor,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.08,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: MaterialButton(
                    color: kLogoColor,
                    onPressed: cartProvider.shopItems.contains(shopItem)
                        ? null
                        : () {
                            cartProvider.addToCart(shopItem);
                          },
                    disabledColor: colorLogo[400],
                    child: Text(
                      cartProvider.shopItems.contains(shopItem)
                          ? "Added successfully!"
                          : "Add To Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
