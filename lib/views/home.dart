import 'package:ecomstore/constants/colors.dart';
import 'package:ecomstore/models/shopitem.dart';
import 'package:ecomstore/providers/ecom_provider.dart';
import 'package:ecomstore/views/shopitem_details.dart';
import 'package:ecomstore/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  HomeView({
    Key? key,
    required this.optionStyle,
  }) : super(key: key);

  final TextStyle optionStyle;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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

  void setShopItemsList() {
    switch (selectedCategory) {
      case "All":
        shopItems = _ecomProvider.getShopItems();
        break;
      case "Hat":
        shopItems = _ecomProvider.getAllHats();
        break;
      case "Jacket":
        shopItems = _ecomProvider.getAllJackets();
        break;
      case "Sneaker":
        shopItems = _ecomProvider.getAllSneakers();
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
    return FutureBuilder(
        future: _ecomProvider.getShopItemsFromFirebase(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            //show Error
            return Center(
              child: Text("Error getting Shop Items"),
            );
          }
          if (snapshot.hasData) {
            setShopItemsList();
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
                                  setShopItemsList();
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
