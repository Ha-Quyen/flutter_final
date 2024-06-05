import 'package:flutter/material.dart';
import 'package:flutter_final/router/routers.dart';
import 'package:flutter_final/screens/list_product/list_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: ListProduct.routeName,
        routes: routes,
      ),
    );
  }
}
