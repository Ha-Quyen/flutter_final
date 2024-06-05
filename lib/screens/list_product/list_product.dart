import 'package:flutter/material.dart';
import 'package:flutter_final/components/build_appBar.dart';
import 'package:flutter_final/screens/list_product/components/body.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key});

  static String routeName = "/list_product";

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
      floatingActionButton: InkWell(
        onTap: () {
          // TODO: Push to add product
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: Color(0xFFFF7643),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(1, 3), // changes position of shadow
              ),
            ],
          ),
          child: const Icon(
            color: Colors.white,
            Icons.add,
          ),
        ),
      ),
    );
  }
}
