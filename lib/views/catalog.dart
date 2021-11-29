import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/models/shopitem.dart';
import 'package:ecomstore/services/ecomstore_service.dart';
import 'package:ecomstore/views/shopitem_details.dart';
import 'package:ecomstore/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CatalogView extends StatefulWidget {
  const CatalogView({
    Key? key,
  }) : super(key: key);

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  int selectedIndex = 0;
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
    final ecomstoreService = EcomstoreService.instance;
    return StreamBuilder<List<ShopItem>>(
        stream: ecomstoreService.streamShopItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            //show Error
            return Center(
              child: Text("Error getting Shop Items:\n ${snapshot.error}"),
            );
          }
          if (snapshot.hasData) {
            setShopItemsList(snapshot.data as List<ShopItem>);
            return Container(
              color: Colors.grey.shade100,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                  SizedBox(
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
                      childAspectRatio: size.width / (size.height - 150),
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
                                        height: size.height * 0.3,
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
              child: CircularProgressIndicator(
            color: kLogoColor,
          ));
        });
  }
}
