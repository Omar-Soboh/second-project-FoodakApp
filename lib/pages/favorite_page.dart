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

    return (productsFavorite.isNotEmpty)
        ? Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: productsFavorite.length,
                  itemBuilder: (context, index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.height * 0.022),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(size.height * 0.01),
                      child: Row(
                        children: [
                          Image.asset(
                            productsFavorite[index].imageLink,
                            height: size.height * 0.1,
                            width: size.height * 0.14,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: size.height * 0.01),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productsFavorite[index].title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22,
                                      ),
                                ),
                                Text(
                                  "\$${productsFavorite[index].price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Theme.of(context).primaryColor,
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
                              size: size.height * 0.031,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/bookmark.png",
                  height: size.height * 0.5,
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
