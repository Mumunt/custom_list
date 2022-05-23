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
  final Map<int, int>? columsWidth;
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
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: widget.headers
                .asMap()
                .map((key, value) {
                  TableNewBorder? border = widget.border;

                  if (border != null) {
                    if (key == 0) {
                      border.position = BorderPosition.firstLeft;
                    } else if (key == widget.headers.length - 1) {
                      border.position = BorderPosition.firstRight;
                    } else {
                      border.position = BorderPosition.firstCenter;
                    }
                  }

                  return MapEntry(
                    key,
                    Expanded(
                      flex: widget.columsWidth?[key] ?? 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: border != null
                                ? border.position == BorderPosition.firstLeft
                                    ? Border(
                                        left: BorderSide(
                                            color: border.color,
                                            width: border.left),
                                        top: BorderSide(
                                            color: border.color,
                                            width: border.top),
                                        right: BorderSide(
                                            color: border.color,
                                            width: border.right / 2),
                                        bottom: BorderSide(
                                            color: border.color,
                                            width: widget.bodies.isNotEmpty
                                                ? border.bottom / 2
                                                : border.bottom),
                                      )
                                    : border.position ==
                                            BorderPosition.firstCenter
                                        ? Border(
                                            left: BorderSide(
                                                color: border.color,
                                                width: border.left / 2),
                                            top: BorderSide(
                                                color: border.color,
                                                width: border.top),
                                            right: BorderSide(
                                                color: border.color,
                                                width: border.right / 2),
                                            bottom: BorderSide(
                                                color: border.color,
                                                width: widget.bodies.isNotEmpty
                                                    ? border.bottom / 2
                                                    : border.bottom),
                                          )
                                        : border.position ==
                                                BorderPosition.firstRight
                                            ? Border(
                                                left: BorderSide(
                                                    color: border.color,
                                                    width: border.left / 2),
                                                top: BorderSide(
                                                    color: border.color,
                                                    width: border.top),
                                                right: BorderSide(
                                                    color: border.color,
                                                    width: border.right),
                                                bottom: BorderSide(
                                                    color: border.color,
                                                    width:
                                                        widget.bodies.isNotEmpty
                                                            ? border.bottom / 2
                                                            : border.bottom),
                                              )
                                            : null
                                : null),
                        alignment: Alignment.center,
                        child: value.content,
                      ),
                    ),
                  );
                })
                .values
                .toList(),
          ),
          if (widget.bodies.isNotEmpty) Expanded(child: _initBody()),
        ],
      ),
    );
  }

  Widget _initBody() {
    return ListView.builder(
      shrinkWrap: true,
      controller: controller,
      itemBuilder: (context, index) {
        TableNewBodies body = widget.bodies[index];
        return SizedBox(
          height: 80,
          child: Row(
            children: body.content
                .asMap()
                .map((key, value) {
                  TableNewBorder? border = widget.border;

                  if (border != null) {
                    if (key == 0) {
                      border.position = BorderPosition.firstLeft;
                    } else if (key == widget.headers.length - 1) {
                      border.position = BorderPosition.firstRight;
                    } else {
                      border.position = BorderPosition.firstCenter;
                    }
                  }

                  return MapEntry(
                    key,
                    Expanded(
                      flex: widget.columsWidth?[key] ?? 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: border != null
                                ? border.position == BorderPosition.firstLeft
                                    ? Border(
                                        left: BorderSide(
                                            color: border.color,
                                            width: border.left),
                                        top: BorderSide(
                                            color: border.color,
                                            width: border.top > 0
                                                ? border.top / 2
                                                : 0),
                                        right: BorderSide(
                                            color: border.color,
                                            width: border.right > 0
                                                ? border.right / 2
                                                : 0),
                                        bottom: BorderSide(
                                            color: border.color,
                                            width:
                                                index != widget.bodies.length - 1
                                                    ? border.bottom > 0
                                                        ? border.bottom / 2
                                                        : 0
                                                    : border.bottom),
                                      )
                                    : border.position ==
                                            BorderPosition.firstCenter
                                        ? Border(
                                            left: BorderSide(
                                                color: border.color,
                                                width: border.left > 0
                                                    ? border.left / 2
                                                    : 0),
                                            top: BorderSide(
                                                color: border.color,
                                                width: border.top > 0
                                                    ? border.top / 2
                                                    : 0),
                                            right: BorderSide(
                                                color: border.color,
                                                width: border.right > 0
                                                    ? border.right / 2
                                                    : 0),
                                            bottom: BorderSide(
                                                color: border.color,
                                                width: index !=
                                                        widget.bodies.length - 1
                                                    ? border.bottom > 0
                                                        ? border.bottom / 2
                                                        : 0
                                                    : border.bottom),
                                          )
                                        : border.position ==
                                                BorderPosition.firstRight
                                            ? Border(
                                                left: BorderSide(
                                                    color: border.color,
                                                    width: border.left > 0
                                                        ? border.left / 2
                                                        : 0),
                                                top: BorderSide(
                                                    color: border.color,
                                                    width: border.top > 0
                                                        ? border.top / 2
                                                        : 0),
                                                right: BorderSide(
                                                    color: border.color,
                                                    width: border.right / 2),
                                                bottom: BorderSide(
                                                    color: border.color,
                                                    width: index !=
                                                            widget.bodies.length -
                                                                1
                                                        ? border.bottom > 0
                                                            ? border.bottom / 2
                                                            : 0
                                                        : border.bottom),
                                              )
                                            : null
                                : null),
                        alignment: Alignment.center,
                        child: value,
                      ),
                    ),
                  );
                })
                .values
                .toList(),
          ),
        );
      },
      itemCount: widget.bodies.length,
    );
  }
}
