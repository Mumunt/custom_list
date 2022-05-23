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
    15,
    (i) => i % 3 == 0
        ? DataModel("Marcia Andrews $i", "in.faucibu$i@mail.com",
        "02177835$i", "Dalarnas län", "Russian Federation", null)
    : i % 2 == 0
        ? DataModel("Irma Alexander $i", "irma.alexander$i@mail.com",
            "02178788$i", "Distrito Capital", "New Zealand", dummyData2)
        : DataModel(
            "Ifeoma Weber $i",
            "orci.Weber$i@mail.com",
            "02177835$i",
            "Paraíba",
            "Turkey",
            [DataModel("name", "email", "phone", "region", "country", null)]));

List<DataModel> dummyData2 = List.generate(
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
