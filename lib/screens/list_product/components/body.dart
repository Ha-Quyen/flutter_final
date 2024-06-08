import 'package:flutter/material.dart';
import 'package:flutter_final/components/product_card.dart';
import 'package:flutter_final/model/product.dart';
import 'package:flutter_final/screens/add_product/add_product.dart';
import 'package:flutter_final/screens/edit_product/edit_product.dart';
import 'package:flutter_final/screens/list_product/components/search_product.dart';
import 'package:flutter_final/screens/list_product/view_model/list_product_view_model.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String searchText = "";

  final ListProductViewModel listProductViewModel = ListProductViewModel();

  void loadData() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        listProductViewModel.loadData();
        FocusScope.of(context).unfocus();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> _navigateAddScreen() async {
    // Chuyển đến màn hình thứ hai và đợi kết quả trả về
    final result = await Navigator.pushNamed(context, AddProduct.routeName);

    // Khi quay lại màn hình chính, cập nhật dữ liệu nếu có kết quả trả về
    if (result != null) {
      setState(() {
        loadData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          Column(
            children: [
              SearchProduct(onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              }),
              FutureBuilder<List<Product>>(
                future: listProductViewModel.fetchData(searchText),
                builder: (_, snapshot) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            final result = await Navigator.pushNamed(
                              context,
                              EditProduct.routeName,
                              arguments: listProductViewModel.getDetail(index),
                            );

                            if (result != null) {
                              setState(() {
                                loadData();
                              });
                            }
                          },
                          child: ProductCard(
                            product: snapshot.data![index],
                            onTapStar: (product) {
                              // Hành động khi tap star sẽ lưu dữ liệu, tuy nhiên nó sẽ không reload data
                              listProductViewModel.updateData(product);
                            },
                            onTapDelete: (product) async {
                              // Hành động khi tap delete sẽ lưu dữ liệu, đồng thời sẽ load lại data
                              await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Text(
                                        'Do you want to delete item ${product.name}'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                          // Xóa dữ liệu
                                          listProductViewModel
                                              .deleteData(product);
                                          // Show thông báo
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content:
                                                  Text('Delete Successully'),
                                            ),
                                          );
                                          // reload data
                                          setState(() {
                                            loadData();
                                          });
                                        },
                                        child: const Text('OK'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text('Cancel'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: _navigateAddScreen,
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
          ),
        ],
      ),
    );
  }
}
