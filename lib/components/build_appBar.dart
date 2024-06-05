import 'package:flutter/material.dart';

AppBar buildAppBar(
  BuildContext context,
  String appbarTitle,
) {
  return AppBar(
    centerTitle: true,
    title: Text(
      appbarTitle,
      style: const TextStyle(color: Colors.black),
    ),
  );
}
