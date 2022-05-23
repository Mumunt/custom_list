import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:table_new/src/model/table_new_bodies.dart';
import 'package:table_new/src/model/table_new_border.dart';
import 'package:table_new/src/model/table_new_header.dart';

class TableNew extends StatefulWidget {
  const TableNew({
    Key? key,
    required this.headers,
    required this.bodies,
    this.columsWidth,
    this.border,
  }) : super(key: key);

  final List<TableNewHeader> headers;
  final List<TableNewBodies> bodies;
  final Map<int, TableColumnWidth>? columsWidth;
  final TableNewBorder? border;

  @override
  State<TableNew> createState() => _TableNewState();
}

class _TableNewState extends State<TableNew> {
  int page = 1;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      if (controller.position.atEdge) {
        bool isTop = controller.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          print('At the bottom');
          setState(() {
            page++;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TableNewBorder? border = widget.border;

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: border != null
                    ? Border(
                        left:
                            BorderSide(color: border.color, width: border.left),
                        top: BorderSide(color: border.color, width: border.top),
                        right: BorderSide(
                            color: border.color, width: border.right),
                        bottom: BorderSide(
                            color: border.color,
                            width: widget.bodies.isNotEmpty
                                ? border.bottom / 2
                                : border.bottom))
                    : null),
            child: Row(
              children: widget.headers
                  .asMap()
                  .map((key, value) {
                    return MapEntry(
                      key,
                      Expanded(
                        // flex: widget.columsWidth?[key] ?? 1,
                        flex: null ?? 1,
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: value.content,
                            ),
                            if (key != widget.headers.length - 1)
                              const Positioned(
                                top: 0,
                                right: 0,
                                bottom: 0,
                                child: IntrinsicHeight(
                                  child: VerticalDivider(
                                    color: Colors.red,
                                    width: 0.5,
                                    thickness: 2,
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    );
                  })
                  .values
                  .toList(),
            ),
          ),
          if (widget.bodies.isNotEmpty) _initBody(),
        ],
      ),
    );
  }

  Widget _initBody() {
    return ListView.builder(
      shrinkWrap: true,
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        TableNewBodies body = widget.bodies[index];
        TableNewBorder? border = widget.border;

        if (border != null) {
          if (index == 0) {
            border.position = BorderPosition.firstLeft;
          } else if (index == widget.headers.length - 1) {
            border.position = BorderPosition.firstRight;
          } else {
            border.position = BorderPosition.firstCenter;
          }
        }
        return Container(
          decoration: BoxDecoration(
              border: border != null
                  ? border.position == BorderPosition.firstLeft
                      ? Border(
                          left: BorderSide(
                              color: border.color, width: border.left),
                          top: BorderSide(
                              color: border.color,
                              width: border.top > 0 ? border.top / 2 : 0),
                          right: BorderSide(
                              color: border.color, width: border.right),
                          bottom: BorderSide(
                              color: border.color,
                              width: index != widget.bodies.length - 1
                                  ? border.bottom > 0
                                      ? border.bottom / 2
                                      : 0
                                  : border.bottom),
                        )
                      : border.position == BorderPosition.firstCenter
                          ? Border(
                              left: BorderSide(
                                  color: border.color, width: border.left),
                              top: BorderSide(
                                  color: border.color,
                                  width: border.top > 0 ? border.top / 2 : 0),
                              right: BorderSide(
                                  color: border.color, width: border.right),
                              bottom: BorderSide(
                                  color: border.color,
                                  width: index != widget.bodies.length - 1
                                      ? border.bottom > 0
                                          ? border.bottom / 2
                                          : 0
                                      : border.bottom),
                            )
                          : border.position == BorderPosition.firstRight
                              ? Border(
                                  left: BorderSide(
                                    color: border.color,
                                    width: border.left,
                                  ),
                                  top: BorderSide(
                                      color: border.color,
                                      width:
                                          border.top > 0 ? border.top / 2 : 0),
                                  right: BorderSide(
                                    color: border.color,
                                    width: border.right,
                                  ),
                                  bottom: BorderSide(
                                      color: border.color,
                                      width: index != widget.bodies.length - 1
                                          ? border.bottom > 0
                                              ? border.bottom / 2
                                              : 0
                                          : border.bottom),
                                )
                              : null
                  : null),
          child: _itemRowsData(body),
        );
      },
      itemCount: widget.bodies.length,
    );
  }

  Widget _itemRowsData(TableNewBodies body) {
    return body.children != null && body.children!.length > 0 ? ExpandableNotifier(
      child: Expandable(
        collapsed: ExpandableButton(
          child: Table(
            columnWidths: widget.columsWidth,
            border: widget.border != null
                ? TableBorder(
              verticalInside: BorderSide(
                width: widget.border!.verticalInside,
                color: widget.border!.color,
              ),
            )
                : null,
            children: [
              TableRow(
                  children: body.content
                      .map((value) => Container(
                    alignment: Alignment.center,
                    child: value,
                  ))
                      .toList())
            ],
          ),
        ),
        expanded: ExpandableButton(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  columnWidths: widget.columsWidth,
                  border: TableBorder(
                      verticalInside: BorderSide(), bottom: BorderSide()),
                  children: [
                    TableRow(
                        children: body.content
                            .map((value) => Container(
                          alignment: Alignment.center,
                          child: value,
                        ))
                            .toList())
                  ],
                ),
                for(var data in body.children!)
                  _itemRowsData(data),
              ],
            )),
      ),
    ) : Table(
      columnWidths: widget.columsWidth,
      border: widget.border != null
          ? TableBorder(
        verticalInside: BorderSide(
          width: widget.border!.verticalInside,
          color: widget.border!.color,
        ),
      )
          : null,
      children: [
        TableRow(
            children: body.content
                .map((value) => Container(
              alignment: Alignment.center,
              child: value,
            ))
                .toList())
      ],
    );
  }

  // Widget _itemExpandDataRow(TableNewBodies body) {
  //   return ;
  // }
}
