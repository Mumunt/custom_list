import 'package:flutter/material.dart';

class TableNewBodies {
  List content;
  List<TableNewBodies>? children;

  TableNewBodies({required this.content, this.children}) : assert(content is List<Widget> || content is List<TableNewBodies>);
}