import 'package:flutter/material.dart';

Widget text14Normal({String text = "", color = Colors.black}) {
  // AppColors colors = AppColors();
  // colors.x = 10;
  //static vers can not be accessed through the instance of the class
  return Text(
    text,
    style: TextStyle(
        color: Colors.white, fontSize: 14.5, fontWeight: FontWeight.bold),
  );
}

Widget text22Normal({
  String text = "",
  double SIZE = 22,
  Color color = Colors.yellow,
}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: SIZE, fontWeight: FontWeight.bold),
  );
}

Widget text19Normal({String text = "", Color color = Colors.yellow}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: 19, fontWeight: FontWeight.bold),
  );
}

Widget text17Normal({String text = "", Color color = Colors.yellow}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: 17, fontWeight: FontWeight.bold),
  );
}
