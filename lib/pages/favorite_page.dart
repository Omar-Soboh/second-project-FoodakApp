import 'package:flutter/material.dart';
import 'package:foodak/models/product_model.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<ProductModel> productsFavorite = products
      .where((product) => product.isFavorite == true)
      .toList();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScaler = MediaQuery.of(context).textScaler;
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape ;

    return (productsFavorite.isNotEmpty)
        ? Padding(
          padding: EdgeInsets.symmetric(horizontal:(isLandscape)?size.height * 0.1:size.height * 0.0),
          child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: productsFavorite.length,
                    itemBuilder: (context, index) => Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular((isLandscape)?size.height * 0.1:size.height * 0.022),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal:(isLandscape)?size.height * 0.06:size.height * 0.01),
                        child:  Row(
                          children: [
                            Image.asset(
                              productsFavorite[index].imageLink,
                              height: (isLandscape)?size.height * 0.38:size.height * 0.1,
                              width: (isLandscape)?size.width * 0.2:size.width * 0.22,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: (isLandscape)?size.width * 0.02:size.width * 0.035),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: (isLandscape)?size.height * 0.1:size.height * 0.04,
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
                                    height: (isLandscape)?size.height * 0.09:size.height * 0.032,
                                    child: FittedBox(
                                      child: Text(
                                        "\$${productsFavorite[index].price}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: textScaler.scale(18),
                                              color: Theme.of(context).primaryColor,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  final int selectedIconFavoriteIndex = products
                                      .indexOf(productsFavorite[index]);
                                  productsFavorite.removeAt(index);
                                  products[selectedIconFavoriteIndex] =
                                      products[selectedIconFavoriteIndex]
                                          .copyWith(isFavorite: false);
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: Theme.of(context).primaryColor,
                                size: (isLandscape)?size.height * 0.1:size.height * 0.031,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/bookmark.png",
                  height: (isLandscape)?size.height * 0.4:size.height * 0.55,
                  width: (isLandscape)?size.width * 0.24:size.width * 0.6,
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
            ),
          );
  }
}
