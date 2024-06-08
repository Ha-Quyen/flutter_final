import 'package:flutter/material.dart';
import 'package:flutter_final/components/build_appBar.dart';
import 'package:flutter_final/screens/list_product/components/body.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  static String routeName = "/list_product";

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        "List Product",
      ),
      body: const Center(
        child: Body(),
      ),
    );
  }
}
