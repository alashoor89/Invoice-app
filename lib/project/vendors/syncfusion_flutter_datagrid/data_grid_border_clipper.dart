import 'package:flutter/material.dart';

class DataGridBorderClipper extends CustomClipper<Rect> {
  const DataGridBorderClipper();

  @override
  Rect getClip(final Size size) {
    return Rect.fromLTWH(2, 2, size.width - 4, size.height - 4);
  }

  @override
  bool shouldReclip(final CustomClipper<Rect> oldClipper) => false;
}
