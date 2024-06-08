import 'package:flutter/material.dart';
import 'package:flutter_final/model/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final bool showOption;
  final ValueChanged<Product>? onTapDelete;
  final ValueChanged<Product>? onTapStar;

  const ProductCard({
    super.key,
    required this.product,
    this.showOption = true,
    this.onTapDelete,
    this.onTapStar,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool isStar = false;

  @override
  void initState() {
    super.initState();
    isStar = widget.product.isStar;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Adjust height as needed
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          // Product image
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              image: DecorationImage(
                image: NetworkImage(widget.product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Product details
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  maxLines: 1,
                  widget.product.description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  "${widget.product.price} \$",
                  style: const TextStyle(fontSize: 14, color: Colors.green),
                ),
              ],
            ),
          ),

          if (widget.showOption)
            SizedBox(
              width: 40,
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (widget.onTapDelete != null) {
                        widget.onTapDelete!(widget.product);
                      }
                    },
                    child: const Icon(
                      size: 30,
                      color: Colors.red,
                      Icons.delete_outline,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isStar = !isStar;
                        widget.product.isStar = isStar;
                      });

                      if (widget.onTapStar != null) {
                        widget.onTapStar!(widget.product);
                      }
                    },
                    child: Icon(
                      size: 30,
                      color: isStar ? Colors.yellow : Colors.grey,
                      isStar ? Icons.star : Icons.star_outline,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
