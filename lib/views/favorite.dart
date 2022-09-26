import 'package:ecomstore/constants/constants.dart';
import 'package:ecomstore/models/shopitem.dart';
import 'package:ecomstore/api/ecomstore_api.dart';
import 'package:ecomstore/providers/catalog_provider.dart';
import 'package:ecomstore/providers/favorite_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../utils/show_state.dart';

/// Display the favorite products
class FavoriteView extends StatelessWidget {
  const FavoriteView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final catalogProvider = context.read<CatalogProvider>();
    catalogProvider.status = CatalogStatus.initial;

    switch (favoriteProvider.status) {
      case FavoriteStatus.initial:
        favoriteProvider.getFavorites();
        return const Center(
            child: CircularProgressIndicator(
          color: kLogoColor,
        ));
      case FavoriteStatus.loading:
        return const Center(
            child: CircularProgressIndicator(
          color: kLogoColor,
        ));
      case FavoriteStatus.success:
        final favoriteShopItems = favoriteProvider.favoriteShopItems;
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: favoriteShopItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading:
                              Image.network(favoriteShopItems[index].imageUrl),
                          title: Text(favoriteShopItems[index].name),
                          trailing: IconButton(
                            onPressed: () {
                              favoriteProvider.setFavorite(
                                  favoriteShopItems[index].id, false);
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
      case FavoriteStatus.error:
        return Center(
          child: Text(favoriteProvider.errorMessage),
        );
    }
  }
}
