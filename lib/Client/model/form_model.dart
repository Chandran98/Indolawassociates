import 'dart:convert';


// To parse this JSON data, do
//
//     final FormModel = formModelFromJson(jsonString);

FormModel formModelFromJson(String str) => FormModel.fromJson(json.decode(str));

String formModelToJson(FormModel data) => json.encode(data.toJson());

class FormModel {
  String name;
  String gender;
  String email;
  String mobile;
  String address;
  String service;

  FormModel(
      {required this.mobile,
      required this.name,
      required this.address,
      required this.email,
      required this.gender,
      required this.service});

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        address: json["address"],
        gender: json["gender"],
        service: json["service"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "email": email,
        "address": address,
        "mobile": mobile,
        "service": service,
        };
}
