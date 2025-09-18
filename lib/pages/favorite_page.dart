import 'package:flutter/material.dart';
import 'package:foodak/models/product_model.dart';
import 'package:foodak/pages/product_details_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<ProductModel> productsFavorite = products
      .where((product) => product.isFavorite == true)
      .toList();

  Widget textButtonFavLandscape({required int index, required Size size}) {
    return TextButton.icon(
      label: Text(
        "Favorite",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).primaryColor,
        ),
      ),
      icon: Icon(
        Icons.favorite,
        color: Theme.of(context).primaryColor,
        size: size.height * 0.09,
      ),
      onPressed: () {
        setState(() {
          final int selectedIconFavoriteIndex = products.indexOf(
            productsFavorite[index],
          );
          productsFavorite.removeAt(index);
          products[selectedIconFavoriteIndex] =
              products[selectedIconFavoriteIndex].copyWith(isFavorite: false);
        });
      },
    );
  }

  Widget textButtonFavPortrait({required int index, required Size size}) {
    return IconButton(
      onPressed: () {
        setState(() {
          final int selectedIconFavoriteIndex = products.indexOf(
            productsFavorite[index],
          );
          productsFavorite.removeAt(index);
          products[selectedIconFavoriteIndex] =
              products[selectedIconFavoriteIndex].copyWith(isFavorite: false);
        });
      },
      icon: Icon(
        Icons.favorite,
        color: Theme.of(context).primaryColor,
        size: size.height * 0.031,
      ),
    );
  }

  Widget emptyFav({required bool isLandscape, required Size size}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/bookmark.png",
          height: (isLandscape) ? size.height * 0.4 : size.height * 0.55,
          width: (isLandscape) ? size.width * 0.24 : size.width * 0.6,
          fit: BoxFit.cover,
        ),
        //  SizedBox(height: 10,),
        Text(
          "No Item Selected",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Colors.black38,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScaler = MediaQuery.of(context).textScaler;
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return (productsFavorite.isNotEmpty)
        ? Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (isLandscape) ? size.height * 0.1 : size.height * 0.0,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: productsFavorite.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            (isLandscape)
                                ? size.height * 0.1
                                : size.height * 0.022,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: (isLandscape)
                                ? size.height * 0.06
                                : size.height * 0.01,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                productsFavorite[index].imageLink,
                                height: (isLandscape)
                                    ? size.height * 0.38
                                    : size.height * 0.1,
                                width: (isLandscape)
                                    ? size.width * 0.2
                                    : size.width * 0.22,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(
                                width: (isLandscape)
                                    ? size.width * 0.02
                                    : size.width * 0.035,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: (isLandscape)
                                          ? size.height * 0.1
                                          : size.height * 0.04,
                                      child: FittedBox(
                                        child: Text(
                                          productsFavorite[index].title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: textScaler.scale(22),
                                              ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: (isLandscape)
                                          ? size.height * 0.09
                                          : size.height * 0.032,
                                      child: FittedBox(
                                        child: Text(
                                          "\$${productsFavorite[index].price}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: textScaler.scale(18),
                                                color: Theme.of(
                                                  context,
                                                ).primaryColor,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              (isLandscape)
                                  ? textButtonFavLandscape(
                                      index: index,
                                      size: size,
                                    )
                                  : textButtonFavPortrait(
                                      index: index,
                                      size: size,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Center(
            child: emptyFav(isLandscape: isLandscape, size: size),
          );
  }
}
