import 'package:uuid/uuid.dart';

class Product {
  final String id = const Uuid().v4();
  late String name;
  late String description;
  late String image;
  late double price;

  Product({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });
}

final List<Product> listProduct = [
  Product(
      name: 'Product 1',
      description: 'Description of product 1',
      image: 'https://picsum.photos/id/0/5000/3333',
      price: 150.0),
  Product(
      name: 'Product 2',
      description: 'Description of product 2',
      image: 'https://picsum.photos/id/1/5000/3333',
      price: 150.0),
  Product(
      name: 'Product 3',
      description: 'Description of product 3',
      image: 'https://picsum.photos/id/2/5000/3333',
      price: 150.0),
];
