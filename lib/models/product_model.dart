// ignore_for_file: public_member_api_docs, sort_constructors_first


class ProductModel {
  final String title;
  final double price;
  final String imageLink;
  final bool isFavorite ;
  ProductModel({required this.imageLink, required this.title, required this.price, this.isFavorite = false});

  

  ProductModel copyWith({
    String? title,
    double? price,
    String? imageLink,
    bool? isFavorite ,
  }) {
    return ProductModel(
      title: title ?? this.title,
      price: price ?? this.price,
      imageLink: imageLink ?? this.imageLink,
      isFavorite: isFavorite ?? this.isFavorite ,
    );
  }
}

List<ProductModel> products = [
  ProductModel(imageLink: "assets/images/shawerma.jpg", title: "shawerma", price: 10),
  ProductModel(imageLink: "assets/images/salad.jpg", title: "salad", price: 10),
  ProductModel(imageLink: "assets/images/potaotes.jpg", title: "potaotes", price: 10),
  ProductModel(imageLink: "assets/images/pizza.jpg", title: "pizza", price: 10),
  ProductModel(imageLink: "assets/images/pizza.jpg", title: "pizza", price: 10),
  ProductModel(imageLink: "assets/images/meat.jpg", title: "meat", price: 10),
  ProductModel(imageLink: "assets/images/fish.jpg", title: "fish", price: 10),
  ProductModel(imageLink: "assets/images/cake.jpg", title: "cake", price: 10),
];
