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
    final size = MediaQuery.of(context).size;
    final textScaler = MediaQuery.of(context).textScaler;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.height * 0.02),
      ),
      child: Padding(
        padding: EdgeInsets.all(size.height * 0.01),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  products[widget.index].imageLink,
                  height: size.height * 0.12,
                  fit: BoxFit.contain,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: size.height * 0.036,
                    width: size.height * 0.036,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.height * 0.02),
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
                        size: size.height * 0.031,
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
              fontSize: textScaler.scale(22)),
              ),        
             Text(
              "\$${products[widget.index].price}",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: textScaler.scale(18),
                color: Theme.of(context).primaryColor,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
