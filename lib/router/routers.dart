import 'package:flutter/material.dart';
import 'package:flutter_final/screens/add_product/add_product.dart';
import 'package:flutter_final/screens/edit_product/edit_product.dart';
import 'package:flutter_final/screens/list_product/list_product.dart';

final Map<String, WidgetBuilder> routes = {
  ListProduct.routeName: (context) => const ListProduct(),
  AddProduct.routeName: (context) => const AddProduct(),
  EditProduct.routeName: (context) => const EditProduct()
};
