import 'dart:html';

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

  @override
  void initState() {
    super.initState();
    // initPlatformState();
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
            child: TableNew(
              columsWidth: {
                0: FlexColumnWidth(1),
              },
              // border: TableNewBorder(color: Colors.blue,bottom: 2, top: 2),
              border: TableNewBorder(),
              headers: [
                TableNewHeader(
                  content: const Text("Name"),
                ),
                TableNewHeader(
                  content: const Text("Email"),
                ),
                TableNewHeader(
                  content: const Text("Phone"),
                ),
                TableNewHeader(
                  content: const Text("Region"),
                ),
                TableNewHeader(
                  content: const Text("Country"),
                )
              ],

              bodies: List.generate(
                dummyData.length,
                (index) => TableNewBodies(
                  // content: List<Widget>.generate(5, (index) => Text("Body $index")),
                  content: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(dummyData[index].name),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(dummyData[index].email),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(dummyData[index].phone),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(dummyData[index].region),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(dummyData[index].country),
                    )
                  ],
                  children: dummyData[index].child != null ? recursive(dummyData[index].child!)  : null,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<TableNewBodies> recursive(List<DataModel> data) {
    print(data.first.toJson());
    return <TableNewBodies>[
      for(var value in data)
    TableNewBodies(
        content: <Widget>[
          Text(value.name),
          Text(value.email),
          Text(value.phone),
          Text(value.region),
          Text(value.country)
        ],
        children: value.child != null ? recursive(value.child!)  : null,
    ),
    ];
  }
}
