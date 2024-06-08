import 'package:flutter/material.dart';
import 'package:flutter_final/components/build_appBar.dart';
import 'package:flutter_final/model/product.dart';
import 'package:flutter_final/screens/edit_product/components/body.dart';

class EditProduct extends StatelessWidget {
  const EditProduct({super.key});

  static String routeName = "/edit_product";

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: buildAppBar(
        context,
        "Edit Product",
      ),
      body: Center(
        child: Body(
          product: product,
        ),
      ),
    );
  }
}
