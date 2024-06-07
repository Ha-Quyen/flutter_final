import 'dart:convert';

import 'package:flutter_final/configs/constants.dart';
import 'package:flutter_final/model/product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class ListProductViewModel {
  ListProductViewModel();

  List<Product> listProduct = [];
  List<Product> listSearchData = [];

  late SharedPreferences sp;

  loadData() async {
    sp = await SharedPreferences.getInstance();
    // Lấy data dưới dạng string
    List<String>? dataStr = sp.getStringList(Constants.LocalData);

    if (dataStr != null) {
      listProduct = dataStr
          .map((contact) => Product.fromJson(json.decode(contact)))
          .toList();

      print(dataStr);
      print(listProduct);
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
}
