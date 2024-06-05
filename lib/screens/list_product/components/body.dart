import 'package:flutter/material.dart';
import 'package:flutter_final/components/product_card.dart';
import 'package:flutter_final/model/product.dart';
import 'package:flutter_final/screens/list_product/components/search_product.dart';
import 'package:flutter_final/screens/list_product/view_model/list_product_view_model.dart';
import 'package:uuid/uuid.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ListProductViewModel listProductViewModel = ListProductViewModel();
  late String searchText = "";

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
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
                    return Dismissible(
                      key: Key(const Uuid().v4()),
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: const Text(
                                  'Do you want to delete item '),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
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
                      onDismissed: (direction) {
                        setState(() {
                          // listProductViewModel.deleteData(index);
                          // searchText = searchText;
                        });
                        // Hiển thị thông báo đã xóa
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Delete Successully'),
                          ),
                        );
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // TODO: Push to Edit product
                        },
                        child: ProductCard(
                          product: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
