import 'package:flutter/material.dart';
import 'package:foodak/models/product_model.dart';
import 'package:foodak/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/foodaklogo.png",
            height: size.height * 0.28,
            width: size.height * 0.45,
            fit: BoxFit.cover,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: size.height * 0.015,
              crossAxisSpacing: size.height * 0.015,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) => ProductItem(index: index),
          ),
        ],
      ),
    );
  }
}
