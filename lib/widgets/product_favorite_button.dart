import 'package:flutter/material.dart';
import 'package:foodak/models/product_model.dart';

class ProductFavoriteButton extends StatefulWidget {
  final int index;
  final BoxConstraints constraints;
  const ProductFavoriteButton({super.key, required this.index, required this.constraints});

  @override
  State<ProductFavoriteButton> createState() => _ProductFavoriteButtonState();
}

class _ProductFavoriteButtonState extends State<ProductFavoriteButton> {
    
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  void didUpdateWidget ( oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
                    height: widget.constraints.maxHeight * 0.19,
                    width: widget.constraints.maxWidth * 0.19,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.constraints.maxHeight * 0.1),
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
                        size: widget.constraints.maxHeight * 0.14,
                      ),
                    ),
                  );
  }
}