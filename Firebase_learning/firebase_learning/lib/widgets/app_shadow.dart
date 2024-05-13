import 'package:flutter/material.dart';

BoxDecoration appBoxShadow({
  Color color = Colors.blue,
  double Rad = 30.0, // Specify the type for Rad
  double BR = 2.0, // Specify the type for BR
}) {
  return BoxDecoration(
    color: color,
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 255, 0, 0),
        Color.fromARGB(255, 255, 0, 85),
        Color.fromARGB(255, 255, 0, 217),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    borderRadius: BorderRadius.circular(Rad),
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(0.150),
        blurRadius: BR,
        offset: const Offset(0, 0), //x,y
        spreadRadius: 15,
      ),
    ],
  );
}

BoxDecoration appBoxDecorationTextField({
  Color color = Colors.blue,
  double Rad = 20.0,
  double BR = 2.0,
  //Color borderColor = Colors.red
}) {
  return BoxDecoration(
    //border: Border.all(color: borderColor),
    color: color,
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 141, 218, 252),
        Color.fromARGB(255, 135, 153, 255),
        Color.fromARGB(255, 206, 127, 255),
        Color.fromARGB(255, 215, 84, 255)
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    borderRadius: BorderRadius.circular(Rad),
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(0.150),
        blurRadius: BR,
        offset: const Offset(0, 0), //x,y
        spreadRadius: 10,
      ),
    ],
  );
}
