import 'package:flutter/material.dart';

typedef WidgetTable = Widget Function(bool isExpanded);
class TableNewBodies {
  ///Content Must List<Widget> || Widget
  List<WidgetTable>? contents;
  WidgetTable? body;
  List<TableNewBodies>? children;
  BoxDecoration? decoration;

  TableNewBodies({this.contents, this.body, this.children, this.decoration})
      : assert(
          !(body != null && contents != null),
          'Isi Salah satu di Body atau Content, Tidak Bisa Keduanya',
        ),
        assert(
          !(body == null && contents == null),
          'Body atau Content Harus disi',
        );
// : assert(content is List<Widget> || content is Widget), assert(content is List<Widget> || content is Widget);
}

// class TableNewBodies {
//   List Function(ExpandableButton? expandedButton) content;
//   List<TableNewBodies>? children;
//
//   TableNewBodies({required this.content, this.children});
// }
