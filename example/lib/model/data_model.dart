import 'package:flutter/material.dart';

class DataModel {
  final String name;
  final String email;
  final String phone;
  final String region;
  final String country;
  final List<DataModel>? child;

  DataModel(
      this.name, this.email, this.phone, this.region, this.country, this.child);

  Map<String, dynamic> toJson() => {
        "name": this.name,
        "email": this.email,
        "phone": this.phone,
        "region": this.region,
        "country": this.country,
        "child": this.child,
      };
}

List<DataModel> dummyData = List.generate(
    20,
    (i) => i % 3 == 0
        ? DataModel("Header $i", "Header$i@mail.com",
        "02177835$i", "Dalarnas län", "Russian Federation", null)
    : i % 2 == 0
        ? DataModel("Header $i", "Header$i@mail.com",
            "02178788$i", "Distrito Capital", "New Zealand", dummyData2)
        : DataModel(
            "Header $i",
            "Header$i@mail.com",
            "02177835$i",
            "Paraíba",
            "Turkey",
            [DataModel("child 1", "email@mail.com", "phone", "region", "country", null)]));

List<DataModel> dummyData2 = List.generate(
    4,
    (index) => index % 2 == 0
        ? DataModel(
            "child 1.$index",
            "child1.$index@mail.com",
            "02178788$index",
            "Distrito Capital",
            "Zealand",
            [DataModel("child 2.$index", "child2.$index@mail.com", "phone", "region", "country", dummyData3)])
        : DataModel(
            "child 1.$index",
            "child1.$index@mail.com",
            "02178788$index",
            "Distrito ",
            "New",
            [DataModel("child 2.$index", "child2.$index@mail.com", "phone", "region", "country", null)]));


List<DataModel> dummyData3 = List.generate(
    4,
        (index) => index % 2 == 0
        ? DataModel(
        "child 3.$index",
        "child3.$index@mail.com",
        "02178788$index",
        "Distrito Capital",
        "Zealand",
        [DataModel("child 4.$index", "child4.$index@mail.com", "phone", "region", "country", dummyData4)])
        : DataModel(
        "child 3.$index",
        "child3.$index@mail.com",
        "02178788$index",
        "Distrito ",
        "New",
        [DataModel("child 4.$index", "child4.$index@mail.com", "phone", "region", "country", null)]));

List<DataModel> dummyData4 = List.generate(
    5,
        (index) => index % 2 == 0
        ? DataModel(
        "child  5.$index",
        "child5.$index@mail.com",
        "02178788$index",
        "Distrito Capital",
        "Zealand",
        [DataModel("child 6.$index", "child6.$index@mail.com", "phone", "region", "country", null)])
        : DataModel(
        "child 5.$index",
        "child5.$index@mail.com",
        "02178788$index",
        "Distrito ",
        "New",
        [DataModel("child 6.$index", "child6.$index@mail.com", "phone", "region", "country", null)]));

List<DataModel> dummyData5 = List.generate(
    5,
        (index) => index % 2 == 0
        ? DataModel(
        "Andrews $index",
        "faucibus$index@mail.com",
        "02178788$index",
        "Distrito Capital",
        "Zealand",
        [DataModel("name", "email", "phone", "region", "country", null)])
        : DataModel(
        "Alexander $index",
        "alexander$index@mail.com",
        "02178788$index",
        "Distrito ",
        "New",
        [DataModel("name", "email", "phone", "region", "country", null)]));
