import 'package:flutter/material.dart';

class SearchProduct extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchProduct({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color(0xFFFF7643)), // Màu viền khi focus
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onChanged: (value) {
          onChanged(value);
        },
      ),
    );
  }
}
