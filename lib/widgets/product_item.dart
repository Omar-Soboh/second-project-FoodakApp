import 'package:flutter/material.dart';
import 'package:foodak/models/product_model.dart';

class ProductItem extends StatefulWidget {
  final int index;
  const ProductItem({super.key, required this.index});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  products[widget.index].imageLink,
                  height: 90,
                  fit: BoxFit.contain,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.black12,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          products[widget.index] = products[widget.index]
                              .copyWith(
                                isFavorite: !products[widget.index].isFavorite,
                              );
                        });
                      },
                      child: Icon(
                        (products[widget.index].isFavorite == false)
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              products[widget.index].title,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500,
              fontSize: 22,),
            ),
            Text(
              "\$${products[widget.index].price}",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Theme.of(context).primaryColor,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
