import 'dart:convert';

import 'package:flutter_final/configs/constants.dart';
import 'package:flutter_final/model/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Product getDetail(int index) {
    return listSearchData[index];
  }

  void updateData(Product product) {
    // Tìm vị trí phần tử trong danh sách
    int index = listProduct.map((p) => p.id).toList().indexOf(product.id);
    listProduct[index] = product;

    List<String> dataStr =
        listProduct.map((contact) => jsonEncode(contact.toJson())).toList();
    sp.setStringList(Constants.LocalData, dataStr);
  }

  void deleteData(Product product) {
    // Tìm vị trí phần tử trong danh sách
    int index = listProduct.map((p) => p.id).toList().indexOf(product.id);
    listProduct.removeAt(index);

    List<String> dataStr =
        listProduct.map((contact) => jsonEncode(contact.toJson())).toList();
    sp.setStringList(Constants.LocalData, dataStr);
  }
}
