// ignore: dangling_library_doc_comments
import 'dart:convert';

import 'package:flutter_final/configs/constants.dart';
import 'package:flutter_final/model/product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class AddProductViewModel {
  AddProductViewModel();

  late Product previewData = Product(
      id: const Uuid().v4(),
      name: "",
      description: "",
      image: "",
      price: 0.0,
      isStar: false);

  List<Product> listProduct = List.empty(growable: true);

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

  Future<Product> fetchData() {
    return Future.value(previewData);
  }

  Future<bool> checkAction() {
    bool checkSuccess = previewData.image != "" &&
        previewData.name != "" &&
        previewData.description != "" &&
        previewData.price != 0.0;

    return Future.value(checkSuccess);
  }

  void updateName(String name) {
    previewData.name = name;
  }

  void updateDescription(String description) {
    previewData.description = description;
  }

  void updateImage(String image) {
    previewData.image = image;
  }

  void updatePrice(double price) {
    previewData.price = price;
  }

  void insertData() {
    listProduct.add(previewData);

    List<String> dataStr =
        listProduct.map((contact) => jsonEncode(contact.toJson())).toList();
    sp.setStringList(Constants.LocalData, dataStr);
  }
}
