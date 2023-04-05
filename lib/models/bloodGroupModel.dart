// To parse this JSON data, do
//
//     final bloodGroupModel = bloodGroupModelFromJson(jsonString);

import 'dart:convert';

BloodGroupModel bloodGroupModelFromJson(String str) =>
    BloodGroupModel.fromJson(json.decode(str));

String bloodGroupModelToJson(BloodGroupModel data) =>
    json.encode(data.toJson());

class BloodGroupModel {
  BloodGroupModel({
    this.flag,
    this.bloodGroupList,
  });

  String? flag;
  List<BloodGroupList>? bloodGroupList;

  factory BloodGroupModel.fromJson(Map<String, dynamic> json) =>
      BloodGroupModel(
        flag: json["flag"],
        bloodGroupList: json["bloodGroupList"] == null
            ? []
            : List<BloodGroupList>.from(
                json["bloodGroupList"]!.map((x) => BloodGroupList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "flag": flag,
        "bloodGroupList": bloodGroupList == null
            ? []
            : List<dynamic>.from(bloodGroupList!.map((x) => x.toJson())),
      };
}

class BloodGroupList {
  BloodGroupList({
    this.name,
    this.age,
    this.bloodGroup,
    this.address,
  });

  String? name;
  String? age;
  String? bloodGroup;
  String? address;

  factory BloodGroupList.fromJson(Map<String, dynamic> json) => BloodGroupList(
        name: json["name"],
        age: json["age"],
        bloodGroup: json["bloodGroup"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "bloodGroup": bloodGroup,
        "address": address,
      };
}
