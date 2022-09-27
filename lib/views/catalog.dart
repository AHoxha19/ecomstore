import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/models/shopitem.dart';
import 'package:ecomstore/providers/catalog_provider.dart';
import 'package:ecomstore/providers/favorite_provider.dart';
import 'package:ecomstore/views/shopitem_details.dart';
import 'package:ecomstore/widgets/add_dialog.dart';
import 'package:ecomstore/widgets/add_info.dart';
import 'package:ecomstore/widgets/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../widgets/profile_info.dart';

class CatalogView extends StatefulWidget {
  const CatalogView({
    Key? key,
  }) : super(key: key);

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  int selectedIndex = 0;

  final List<String> items = [
    "All",
    "Hat",
    "Jacket",
    "Sneaker",
  ];

  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final catalogProvider = Provider.of<CatalogProvider>(context);
    final favoriteProvider = context.read<FavoriteProvider>();
    favoriteProvider.status = FavoriteStatus.initial;
    switch (catalogProvider.status) {
      case CatalogStatus.initial:
        catalogProvider.getShopItems();
        return const Center(
            child: CircularProgressIndicator(
          color: kLogoColor,
        ));
      case CatalogStatus.loading:
        return const Center(
            child: CircularProgressIndicator(
          color: kLogoColor,
        ));
      case CatalogStatus.success:
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
              buildCategoriesFilterButtons(catalogProvider, height, width),
              SizedBox(
                height: size.height * 0.03,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: size.width / (size.height - 150),
                  children: catalogProvider.catalogShopItems
                      .map((s) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ShopItemDetails.routeName,
                                  arguments: s);
                            },
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: size.height * 0.3,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(s.imageUrl))),
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
                                                fontWeight: FontWeight.bold),
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
      case CatalogStatus.error:
        return Center(
          child: Text(catalogProvider.errorMessage),
        );
    }
  }

  SizedBox buildCategoriesFilterButtons(
      CatalogProvider provider, height, width) {
    return SizedBox(
        height: 35,
        child: Row(
          children: [
            Expanded(
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
                          provider.filterShopItems(selectedCategory);
                        });
                      });
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AddDialog(
                            content: SizedBox(
                              height: height,
                              width: width * 0.2,
                              child: ListView(
                                children: [
                                  AddInfo(
                                      text: "Name",
                                      icon: CupertinoIcons.shopping_cart,
                                      type: AddInfoType.name,
                                      onSubmitted: (value) async {
                                        provider.shopItemToAdd.name = value;
                                      }),
                                  AddInfo(
                                      text: "Category",
                                      icon: CupertinoIcons.archivebox_fill,
                                      type: AddInfoType.category,
                                      onSubmitted: (value) async {
                                        provider.shopItemToAdd.category = value;
                                      }),
                                  AddInfo(
                                      text: "Image URL",
                                      icon: CupertinoIcons.at,
                                      type: AddInfoType.imageUrl,
                                      onSubmitted: (value) async {
                                        provider.shopItemToAdd.imageUrl = value;
                                      }),
                                  AddInfo(
                                      text: "Price",
                                      icon: CupertinoIcons.money_dollar,
                                      type: AddInfoType.price,
                                      onSubmitted: (value) async {
                                        provider.shopItemToAdd.price =
                                            double.parse(value);
                                      }),
                                  AddInfo(
                                      text: "Favorite",
                                      icon: CupertinoIcons.heart_fill,
                                      type: AddInfoType.favorite,
                                      onSubmitted: (value) async {
                                        provider.shopItemToAdd.favorite = value;
                                      }),
                                ],
                              ),
                            ),
                            onAdd: () async {
                              print("Data to SAVE");

                              await provider.addShopItem();
                            });
                      });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(colorLogo[500])),
                child: const Icon(Icons.add))
          ],
        ));
  }
}
