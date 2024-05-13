import 'package:flutter/material.dart';

Widget appImage(
    {String imagePath = "lib/assets/icons/user.png",
    double width = 16,
    double height = 16}) {
  return Image.asset(
      imagePath.isEmpty ? "lib/assets/icons/user.png" : imagePath,
      width: width,
      height: height);
}
