// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:indo_law/Client/APi/dummyapi.dart';

// class Servicesform extends StatefulWidget {
//   const Servicesform({Key? key}) : super(key: key);

//   @override
//   _ServicesformState createState() => _ServicesformState();
// }

// class _ServicesformState extends State<Servicesform> {
//   Future<FormModel?> serviceform(String name, String job) async {
//     var response = await post(Uri.parse("https://reqres.in/api/users"),
//         body: {
//         "name": name,
//         "job": job
//          });

//     if (response.statusCode == 201) {
//       final String responsedata = response.body;
//       return formModelFromJson(responsedata);
//     } else {
//       return null;
//     }
//   }

//   @override
  
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

// // To parse this JSON data, do
// //
// //     final FormModel = formModelFromJson(jsonString);

// FormModel formModelFromJson(String str) => FormModel.fromJson(json.decode(str));

// String formModelToJson(FormModel data) => json.encode(data.toJson());

// class FormModel {
//   String name;
//   String job;
//   String id;
//   DateTime createdAt;

//   FormModel({
//     required this.name,
//     required this.job,
//     required this.id,
//     required this.createdAt,
//   });

//   factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
//         name: json["name"],
//         job: json["job"],
//         id: json["id"],
//         createdAt: DateTime.parse(json["createdAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "job": job,
//         "id": id,
//         "createdAt": createdAt.toIso8601String(),
//       };
// }
