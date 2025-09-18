import 'package:flutter/material.dart';
import 'package:foodak/models/product_model.dart';
import 'package:foodak/pages/product_details_page.dart';
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
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/foodaklogo.png",
            height: (isLandscape) ? size.height * 0.6 : size.height * 0.45,
            width: (isLandscape) ? size.width * 0.5 : size.width * 0.8,
            fit: BoxFit.cover,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (isLandscape) ? 4 : 2,
              mainAxisSpacing: (isLandscape)
                  ? size.height * 0.05
                  : size.height * 0.02,
              crossAxisSpacing: (isLandscape)
                  ? size.height * 0.05
                  : size.height * 0.02,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) => InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context){
                        return ProductDetailsPage();
                  })
                );
              },
              child: ProductItem(index: index)),
          ),
        ],
      ),
    );
  }
}
