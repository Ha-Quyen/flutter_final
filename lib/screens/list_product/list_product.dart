import 'package:flutter/material.dart';
import 'package:flutter_final/components/build_appBar.dart';
import 'package:flutter_final/screens/add_product/add_product.dart';
import 'package:flutter_final/screens/list_product/components/body.dart';
import 'package:flutter_final/screens/list_product/view_model/list_product_view_model.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  static String routeName = "/list_product";

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
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

  Future<void> _navigateAndReload() async {
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
    return Scaffold(
      appBar: buildAppBar(
        context,
        "List Product",
      ),
      body: Center(
        child: Body(
          listProductViewModel: listProductViewModel,
        ),
      ),
      floatingActionButton: InkWell(
        onTap: _navigateAndReload,
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
