import 'package:flutter/material.dart';
import 'package:table_new/table_new.dart';
import 'package:table_new_example/model/data_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String _platformVersion = 'Unknown';
  ScrollController controller = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();
    // initPlatformState();
    // controller.addListener(() {
    //   //# Pagination
    //   if (controller.position.atEdge) {
    //     bool isTop = controller.position.pixels == 0;
    //     if (isTop) {
    //       print('At the top');
    //     } else {
    //       print('At the bottom');
    //       setState(() {
    //         if(dummyData.length > page * 20){
    //           page++;
    //         }
    //       });
    //     }
    //   }
    // });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   // We also handle the message potentially returning null.
  //   try {
  //     platformVersion =
  //         await TableNew.platformVersion ?? 'Unknown platform version';
  //   } on PlatformException {
  //     platformVersion = 'Failed to get platform version.';
  //   }
  //
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _platformVersion = platformVersion;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: SingleChildScrollView(
            // controller: controller,
            child: TableNew(
              columsWidth: const {
                0: FlexColumnWidth(1),
              },
              tableStyle: TableStyle.firstStyle,
              // border: TableNewBorder(color: Colors.blue,bottom: 2, top: 2),
              border: TableNewBorder(color: Color.fromRGBO(243, 246, 248, 1),verticalInside: 2),
              headers: [
                TableNewHeader(
                  content:  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SelectableText("Name",style: TextStyle(color: Colors.white),),
                  ),
                ),
                TableNewHeader(
                  content: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SelectableText("Email",style: TextStyle(color: Colors.white),),
                  ),
                ),
                TableNewHeader(
                  content: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SelectableText("Phone",style: TextStyle(color: Colors.white),),
                  ),
                ),
                TableNewHeader(
                  content: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SelectableText("Region",style: TextStyle(color: Colors.white),),
                  ),
                ),
                TableNewHeader(
                  content: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SelectableText("Country",style: TextStyle(color: Colors.white),),
                  ),
                )
              ],

              bodies: List.generate(
                // dummyData.length <= page * 20 ? dummyData.length : page * 20,
                dummyData.length,
                (index) => TableNewBodies(
                  // content: List<Widget>.generate(5, (index) => Text("Body $index")),
                  content: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
                      child: Text(dummyData[index].name),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
                      child: Text(dummyData[index].email),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
                      child: Text(dummyData[index].phone),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
                      child: Text(dummyData[index].region),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
                      child: Text(dummyData[index].country),
                    )
                  ],
                  children: dummyData[index].child != null
                      ? recursive(dummyData[index].child!)
                      : null,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<TableNewBodies> recursive(List<DataModel> data,) {
    return <TableNewBodies>[
      for (var value in data)
        TableNewBodies(
          content: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 14),
              child: Text(value.name),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 14),
              child: Text(value.email),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 14),
              child: Text(value.phone),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 14),
              child: Text(value.region),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 14),
              child: Text(value.country),
            )
          ],
          children: value.child != null ? recursive(value.child!) : null,
        ),
    ];
  }
}
