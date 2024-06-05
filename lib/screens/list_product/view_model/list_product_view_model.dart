
import 'dart:convert';

import 'package:flutter_final/model/product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class ListProductViewModel {
  ListProductViewModel();

  List<Product> listProduct = List.empty(growable: true);
  List<Product> listSearchData = List.empty(growable: true);

  late SharedPreferences sp;

  loadData() async {
    sp = await SharedPreferences.getInstance();
    // Lấy data dưới dạng string
    List<String>? dataStr = sp.getStringList('myData');

    if (dataStr != null) {
      listProduct = dataStr
          .map((contact) => Product.fromJson(json.decode(contact)))
          .toList();
    }
  }

  Future<List<Product>> fetchData(String searchText) {
    if (searchText.isEmpty) {
      listSearchData = listProduct;
    } else {
      listSearchData = listProduct
          .where((e) =>
              e.name.toLowerCase().contains(searchText.toLowerCase()) ||
              e.description.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
    return Future.value(listSearchData);
  }

  // saveData() {
  //   Product p = Product(id: const Uuid().v4(), name: "112", description: "22222", image: "image", price: 124, isStar: false);

  //   listProduct.add(p);

  //   List<String> dataStr =
  //       listProduct.map((contact) => jsonEncode(contact.toJson())).toList();
  //   sp.setStringList('myData', dataStr);
  // }
}
