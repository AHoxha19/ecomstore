import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/models/shopitem.dart';
import 'package:ecomstore/services/ecomstore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Display the favorite products
class FavoriteView extends StatelessWidget {
  const FavoriteView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final ecomstoreService = EcomstoreService.instance;

    return StreamBuilder<List<ShopItem>>(
        stream: ecomstoreService.streamShopItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container();
          } else if (snapshot.hasData) {
            final favoriteShopItems =
                snapshot.data!.where((s) => s.favorite).toList();

            if (favoriteShopItems.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.heart_slash_fill,
                      size: height * 0.2,
                      color: Colors.black.withOpacity(0.2),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "No item in favorites",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontSize: height * 0.03),
                    ),
                  ],
                ),
              );
            }

            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: favoriteShopItems.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Image.network(
                                  favoriteShopItems[index].imageUrl),
                              title: Text(favoriteShopItems[index].name),
                              trailing: IconButton(
                                onPressed: () {
                                  favoriteShopItems[index].favorite = false;
                                  ecomstoreService
                                      .setFavorite(favoriteShopItems[index]);
                                },
                                icon: const Icon(CupertinoIcons.clear_circled),
                              ),
                            ),
                          );
                        }),
                  ),
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
