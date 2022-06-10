import 'package:flutter/material.dart';

class TableNewBodies {
  ///Content Must List<Widget> || Widget
  var content;
  List<TableNewBodies>? children;
  BoxDecoration? decoration;

  TableNewBodies({required this.content, this.children, this.decoration}) : assert(content is List<Widget> || content is  Widget);
}

// class TableNewBodies {
//   List Function(ExpandableButton? expandedButton) content;
//   List<TableNewBodies>? children;
//
//   TableNewBodies({required this.content, this.children});
// }