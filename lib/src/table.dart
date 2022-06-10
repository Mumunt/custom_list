import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:table_new/src/model/table_new_bodies.dart';
import 'package:table_new/src/model/table_new_border.dart';
import 'package:table_new/src/model/table_new_header.dart';


enum TableStyle {
  defaultStyle,
  firstStyle,
  secondStyle,
  thirdStyle,
}


class TableNew extends StatefulWidget {
  const TableNew({
    Key? key,
    required this.headers,
    required this.bodies,
    this.columsWidth,
    this.border,
    this.tableStyle = TableStyle.defaultStyle,
  }) : super(key: key);

  final List<TableNewHeader> headers;
  final List<TableNewBodies> bodies;
  final Map<int, TableColumnWidth>? columsWidth;
  final TableNewBorder? border;

  ///Add aditional table style
  final TableStyle tableStyle;

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
    // controller.addListener(() {
    //   //# Pagination
    //   if (controller.position.atEdge) {
    //     bool isTop = controller.position.pixels == 0;
    //     if (isTop) {
    //       print('At the top');
    //     } else {
    //       print('At the bottom');
    //       setState(() {
    //         page++;
    //       });
    //     }
    //   }
    // });

  }



  @override
  Widget build(BuildContext context) {
    TableNewBorder? border = widget.border;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          padding: widget.tableStyle == TableStyle.firstStyle ?  EdgeInsets.symmetric(vertical: 9) : null,
          decoration: BoxDecoration(
              border: border != null
                  ? widget.tableStyle == TableStyle.firstStyle ?  null : Border(
                left: BorderSide(
                    color: border.color, width: border.left),
                top: BorderSide(
                    color: border.color,
                    width: border.top),
                right: BorderSide(
                    color: border.color, width: border.right),
                bottom: BorderSide(
                    color: border.color,
                    width: border.bottom > 0
                        ? border.bottom / 2
                        : 0),
              )
                  : null,
                color: widget.tableStyle == TableStyle.firstStyle ? const Color.fromRGBO(55, 82, 226, 1) : null,
                borderRadius: widget.tableStyle == TableStyle.firstStyle ? BorderRadius.all(Radius.circular(4)) : null,),
          child: Table(
            columnWidths: widget.columsWidth,
            border: widget.border != null
                ? TableBorder(
              verticalInside: BorderSide(
                width: widget.border!.verticalInside,
                color: widget.tableStyle == TableStyle.firstStyle ?  Color.fromRGBO(50, 70, 181, 1): widget.border!.color,
              ),
              // left: BorderSide(
              //     color: border!.color, width: border.left),
              // top: BorderSide(
              //     color: border.color,
              //     width: border.top),
              // right: BorderSide(
              //     color: border.color, width: border.right),
              // bottom: BorderSide(
              //     color: border.color,
              //     width: border.bottom > 0
              //         ? border.bottom / 2
              //         : 0),
            )
                : null,
            children: [
              TableRow(
                // decoration: BoxDecoration(
                //   color: widget.tableStyle == TableStyle.firstStyle
                //       ? const Color.fromRGBO(55, 82, 226, 1) : null
                // ),
                  children: widget.headers
                      .map((value) => Container(

                    alignment: Alignment.center,
                    child: value.content,
                  ))
                      .toList())
            ],
          ),
        ),
        if (widget.bodies.isNotEmpty) _initBody(),
      ],
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

        //List Row
        return Container(
          margin: widget.tableStyle == TableStyle.firstStyle ? EdgeInsets.only(top: 12) : null,
          // TODO : Table Border Container
          decoration: BoxDecoration(
              border: border != null
                  ? widget.tableStyle == TableStyle.firstStyle ?  Border.all(
                width: 2,
                color: border.color
              ) : Border(
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
                        : border.bottom,),
              )
                  : null,
          // borderRadius: widget.tableStyle == TableStyle.firstStyle ? BorderRadius.all(Radius.circular(4)) : null,
          ),
          
          //padding For Border Space body
          // padding: EdgeInsets.symmetric(vertical: 10),
          child: _itemRowsData(body,index !=  widget.bodies.length-1),
        );
      },
      itemCount: widget.bodies.length,
    );
  }

  Widget _itemRowsData(TableNewBodies body, bool isLast) {
    return body.children != null && body.children!.isNotEmpty ? ExpandableNotifier(
      child: Expandable(
        // collapsed: ExpandableButton(
        //   child: Table(
        //     columnWidths: widget.columsWidth,
        //     border: widget.border != null
        //         ? TableBorder(
        //       verticalInside: BorderSide(
        //         width: widget.border!.verticalInside,
        //         color: widget.tableStyle == TableStyle.firstStyle ? Colors.white : widget.border!.color,
        //       ),
        //       bottom: body.children != null &&  !isLast ? BorderSide.none : BorderSide(
        //         color: widget.tableStyle == TableStyle.firstStyle ? Colors.white : widget.border!.color,
        //         width: 2
        //       )
        //
        //     )
        //         : null,
        //     children: [
        //       // Row List Item Content
        //       TableRow(
        //           children: body.content.call(ExpandableButton())
        //               .map((value) => Container(
        //             alignment: Alignment.center,
        //             child: value,
        //           ))
        //               .toList()),
        //     ],
        //   ),
        // ),
        collapsed: body.content is Widget ? Container(
          child:  body.content ,
        ) : Table(
          columnWidths: widget.columsWidth,
          border: widget.border != null
              ? TableBorder(
            verticalInside: BorderSide(
              width: widget.border!.verticalInside,
              color: widget.border!.color,
            ),
            // bottom: BorderSide(
            //   width: 2,
            //   color: widget.border!.color,
            // ),
            // bottom: body.children != null  ? BorderSide() : BorderSide(
            //   color:  widget.border!.color,
            //   width: 2
            // )

          )
              : null,
          children: [
            // Row List Item Content
            TableRow(
                decoration: body.decoration,
                children: body.content
                    .map((value) => Container(
                  alignment: Alignment.center,
                  child: value,
                ))
                    .toList()),
          ],
        ),
        expanded: Container(
          decoration: body.decoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              body.content is Widget ? Container(
                child:  body.content ,
              ) : Table(
                columnWidths: widget.columsWidth,
                border: TableBorder(
                    verticalInside: BorderSide(
                      color: widget.border!.color,
                      width: widget.border!.verticalInside,
                    ),
                  //   // bottom: BorderSide(),
                  // bottom: BorderSide(
                  //   width: 2,
                  //   color: widget.border!.color,
                  // ),
                ),
                children: [
                  TableRow(
                      children: body.content
                          .map((value) => Container(
                        alignment: Alignment.center,
                        child: value,
                      ))
                          .toList()),
                ],
              ),
              if(body.children != null)
              for(var i = 0; i < body.children!.length; i++)
                _itemRowsData(body.children![i], i != body.children!.length-1),
            ],
          ),
        ),
      ),
    ) : body.content is Widget ? Container(
      child:  body.content ,
    ) :  Table(
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
            decoration: body.decoration,
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
