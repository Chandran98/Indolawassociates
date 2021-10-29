// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;


// class MyHomePage extends StatefulWidget {
//   MyHomePage({required Key key, required this.title}) : super(key: key);


//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// Future<UserModel?> createUser(String name, String jobTitle) async{
//   final  apiUrl = Uri.parse("https://reqres.in/api/users");

//   final response = await http.post(apiUrl, body: {
//     "name": name,
//     "job": jobTitle
//   });

//   if(response.statusCode == 201){
//     final String responseString = response.body;
    
//     return userModelFromJson(responseString);
//   }else{
//     return null;
//   }
// }

// class _MyHomePageState extends State<MyHomePage> {

//   late UserModel _user;

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController jobController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body:Container(
//         padding: EdgeInsets.all(32),
//         child: Column(
//           children: <Widget>[

//             TextField(
//               controller: nameController,
//             ),

//             TextField(
//               controller: jobController,
//             ),

//             SizedBox(height: 32,),

//             _user == null ? Container() :
//             Text("The user ${_user.name}, ${_user.id} is created successfully at time ${_user.createdAt.toIso8601String()}"),

//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async{
//           final String name = nameController.text;
//           final String jobTitle = jobController.text;

//           final UserModel? user = await createUser(name, jobTitle);

//           setState(() {
//             _user = user!;
//           });

//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }


// // To parse this JSON data, do
// //
// //     final userModel = userModelFromJson(jsonString);


// UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// String userModelToJson(UserModel data) => json.encode(data.toJson());

// class UserModel {
//   String name;
//   String job;
//   String id;
//   DateTime createdAt;

//   UserModel({
//     required this.name,
//     required this.job,
//      required this.id,
//    required this.createdAt,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//     name: json["name"],
//     job: json["job"],
//     id: json["id"],
//     createdAt: DateTime.parse(json["createdAt"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "job": job,
//     "id": id,
//     "createdAt": createdAt.toIso8601String(),
//   };
// }
