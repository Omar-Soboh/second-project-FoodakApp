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
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  products[widget.index].imageLink,
                  height: constraints.maxHeight * 0.55,
                  fit: BoxFit.contain,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: constraints.maxHeight * 0.19,
                    width: constraints.maxWidth * 0.19,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(constraints.maxHeight * 0.1),
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
                        size: constraints.maxHeight * 0.14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: constraints.maxHeight * 0.05,),
            SizedBox(
              height: constraints.maxHeight * 0.21,
              child: FittedBox(
                child: Text(
                  products[widget.index].title,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500,
                  fontSize: textScaler.scale(22)),
                  ),
              ),
            ),  
              SizedBox(height: constraints.maxHeight * 0.02,),      
             SizedBox(
              height: constraints.maxHeight * 0.17,
               child: FittedBox(
                 child: Text(
                  "\$${products[widget.index].price}",
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall!.copyWith(
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
      ),
    );
  }
}
