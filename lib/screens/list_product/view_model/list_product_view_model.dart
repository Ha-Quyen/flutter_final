
import 'package:flutter_final/model/product.dart';

class ListProductViewModel {
  ListProductViewModel();

  List<Product> listSearchData = [];

  void loadData() {
    listSearchData = listProduct;
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

  void deleteData(int index) {
    listProduct.removeAt(index);
  }
}
