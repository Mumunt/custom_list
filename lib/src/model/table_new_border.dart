import 'package:flutter/material.dart' show Color, Colors;

enum BorderPosition {
  firstLeft,
  firstCenter,
  firstRight,
  midLeft,
  midCenter,
  midRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}

class TableNewBorder {
  final double top;
  final double left;
  final double right;
  final double bottom;
  final Color color;

  TableNewBorder({
    this.top = 1,
    this.left = 1,
    this.right = 1,
    this.bottom = 1,
    // this.color = const Color.fromRGBO(0, 0, 0, 0),
    this.color = Colors.black,
  });

  BorderPosition position = BorderPosition.firstLeft;

  factory TableNewBorder.symmetric(
          {double horizontal = 1, double vertical = 1}) =>
      TableNewBorder(
        top: vertical,
        bottom: vertical,
        left: horizontal,
        right: vertical,
      );
}
