import 'package:flutter/material.dart';
import 'package:foodak/models/product_model.dart';
import 'package:foodak/widgets/product_favorite_button.dart';

class ProductItem extends StatelessWidget {
  final int index;
  const ProductItem({super.key, required this.index});

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
                  products[index].imageLink,
                  height: constraints.maxHeight * 0.55,
                  fit: BoxFit.contain,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ProductFavoriteButton(index: index, constraints: constraints,),
                ),
              ],
            ),
            SizedBox(height: constraints.maxHeight * 0.05,),
            SizedBox(
              height: constraints.maxHeight * 0.21,
              child: FittedBox(
                child: Text(
                  products[index].title,
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
                  "\$${products[index].price}",
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
