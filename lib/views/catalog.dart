import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/models/shopitem.dart';
import 'package:ecomstore/providers/ecom_provider.dart';
import 'package:ecomstore/views/shopitem_details.dart';
import 'package:ecomstore/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CatalogView extends StatefulWidget {
  const CatalogView({
    Key? key,
  }) : super(key: key);

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  int selectedIndex = 0;
  late EcomProvider _ecomProvider;
  List<ShopItem> shopItems = [];

  final List<String> items = [
    "All",
    "Hat",
    "Jacket",
    "Sneaker",
  ];

  String selectedCategory = "All";

  void setShopItemsList(List<ShopItem> shopItemsSnapshot) {
    switch (selectedCategory) {
      case "All":
        shopItems = shopItemsSnapshot;
        break;
      case "Hat":
        shopItems =
            shopItemsSnapshot.where((s) => s.category == "hat").toList();
        break;
      case "Jacket":
        shopItems =
            shopItemsSnapshot.where((s) => s.category == "jacket").toList();
        break;
      case "Sneaker":
        shopItems =
            shopItemsSnapshot.where((s) => s.category == "sneaker").toList();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    _ecomProvider = Provider.of<EcomProvider>(context);
    return StreamBuilder<List<ShopItem>>(
        stream: _ecomProvider.streamShopItems(),
        builder: (context, snapshot) {
          print("shop rebuild");
          if (snapshot.hasError) {
            print("${snapshot.data}");
            //show Error
            return Center(
              child: Text("Error getting Shop Items:\n ${snapshot.error}"),
            );
          }
          if (snapshot.hasData) {
            setShopItemsList(snapshot.data as List<ShopItem>);
            return Container(
              color: Colors.grey.shade100,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Browse By Category",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                      height: 35,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return CategoryListItem(
                              title: items[index],
                              isSelected: selectedIndex == index,
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  selectedCategory = items[index];
                                  setShopItemsList(
                                      snapshot.data as List<ShopItem>);
                                });
                              });
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 10.0,
                          );
                        },
                      )),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth / itemHeight),
                      children: shopItems
                          .map((s) => GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ShopItemDetails.routeName,
                                      arguments: s);
                                },
                                child: Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 325,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image:
                                                    NetworkImage(s.imageUrl))),
                                      ),
                                      const Divider(
                                        height: 3,
                                        color: kLogoColor,
                                        thickness: 3,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 8.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                s.name,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text("${s.price.toString()} CHF")
                                            ]),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  )
                ],
              ),
            );
          }

          return const Center(
            child: Text("Data"),
          );
        });
  }
}
