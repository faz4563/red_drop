// To parse this JSON data, do
//
//     final bloodGroupData = bloodGroupDataFromJson(jsonString);

import 'dart:convert';

List<BloodGroupData> bloodGroupDataFromJson(String str) =>
    List<BloodGroupData>.from(
        json.decode(str).map((x) => BloodGroupData.fromJson(x)));

String bloodGroupDataToJson(List<BloodGroupData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BloodGroupData {
  BloodGroupData({
    this.id,
    this.name,
    this.username,
    this.email,
    this.password,
    this.phone,
    this.bloodGroup,
  });

  Id? id;
  String? name;
  String? username;
  String? email;
  String? password;
  String? phone;
  String? bloodGroup;

  factory BloodGroupData.fromJson(Map<String, dynamic> json) => BloodGroupData(
        id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
        name: json["name"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        bloodGroup: json["bloodGroup"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id?.toJson(),
        "name": name,
        "username": username,
        "email": email,
        "password": password,
        "phone": phone,
        "bloodGroup": bloodGroup,
      };
}

class Id {
  Id({
    this.oid,
  });

  String? oid;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}
