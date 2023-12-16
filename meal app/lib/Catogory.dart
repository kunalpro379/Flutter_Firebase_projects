import 'dart:ui';

import 'package:flutter/material.dart';

class Catogory {
  const Catogory(
      {required this.id, required this.title, this.color = Colors.orange});

  final String id;
  final String title;
  final Color color;
}
