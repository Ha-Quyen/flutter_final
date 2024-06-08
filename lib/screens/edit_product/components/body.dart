import 'package:flutter/material.dart';
import 'package:flutter_final/components/default_button.dart';
import 'package:flutter_final/components/input_from.dart';
import 'package:flutter_final/components/product_card.dart';
import 'package:flutter_final/configs/size_config.dart';
import 'package:flutter_final/model/product.dart';
import 'package:flutter_final/screens/edit_product/view_model/edit_product_view_model.dart';
import 'package:status_alert/status_alert.dart';

class Body extends StatefulWidget {
  final Product product;
  const Body({
    super.key,
    required this.product,
  });

  @override
  // ignore: library_private_types_in_public_api
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var editProductViewModel = EditProductViewModel();

  void loadData() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        editProductViewModel.loadData();
        FocusScope.of(context).unfocus();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
    editProductViewModel.previewData = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputFrom(
                  type: "Image URL",
                  initText: editProductViewModel.previewData.image,
                  onChanged: (value) {
                    setState(() {
                      editProductViewModel.updateImage(value);
                    });
                  },
                ),
                const SizedBox(height: 12),
                InputFrom(
                  type: "Product Name",
                  initText: editProductViewModel.previewData.name,
                  onChanged: (value) {
                    setState(() {
                      editProductViewModel.updateName(value);
                    });
                  },
                ),
                const SizedBox(height: 12),
                InputFrom(
                  type: "Description",
                  initText: editProductViewModel.previewData.description,
                  onChanged: (value) {
                    setState(() {
                      editProductViewModel.updateDescription(value);
                    });
                  },
                ),
                const SizedBox(height: 12),
                InputFrom(
                  type: "Price",
                  initText: editProductViewModel.previewData.price.toString(),
                  keyboard: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      editProductViewModel.updatePrice(
                          value.isEmpty ? 0.0 : double.parse(value));
                    });
                  },
                ),
                const SizedBox(height: 35),
                const Text(
                  "Preview",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FutureBuilder<Product>(
                  future: editProductViewModel.fetchData(),
                  builder: (_, snapshot) {
                    return ProductCard(
                      showOption: false,
                      product: snapshot.data ??
                          Product(
                            id: "",
                            name: "",
                            description: "",
                            image: "",
                            price: 0.0,
                            isStar: false,
                          ),
                    );
                  },
                ),
                const SizedBox(height: 25),
                FutureBuilder<bool>(
                  future: editProductViewModel.checkAction(),
                  builder: (_, snapshot) {
                    return DefaultButton(
                      width: double.infinity,
                      height: 56,
                      radius: 20,
                      backgroundColor: snapshot.data == true
                          ? const Color(0xFFFF7643)
                          : Colors.grey,
                      textColor: Colors.white,
                      textSize: 20,
                      text: "Continue",
                      press: () {
                        if (snapshot.data == true) {
                          StatusAlert.show(
                            context,
                            duration: const Duration(seconds: 2),
                            subtitle: 'Edit Success',
                            configuration:
                                const IconConfiguration(icon: Icons.done),
                            maxWidth: 260,
                          );

                          Future.delayed(const Duration(milliseconds: 2000),
                              () {
                            setState(() {
                              editProductViewModel.updateData();
                            });
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context, "Updated Data");
                          });
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
