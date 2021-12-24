import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

////////////////////////////////////////////  data model ////////////////////////////////////////////////////

class Fetch {
  int userId;
  int id;
  String title;
  Fetch({required this.id, required this.title, required this.userId});
  factory Fetch.fromJson(Map<String, dynamic> json) =>
      Fetch(id: json["id"], title: json["title"], userId: json['userId']);
}

/////////////////////////////////////////////////////// getdata /////////////////////////////////////////////////

class APikey extends StatefulWidget {
  APikey({
    Key? key,
  }) : super(key: key);

  @override
  _APikeyState createState() => _APikeyState();
}

class _APikeyState extends State<APikey> {

  Future<List<Fetch>> getdata() async {
    var response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));

    final result = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return result.map<Fetch>((json) => Fetch.fromJson(json)).toList();
    // return compute(parsefetch, response.body);
  }

  // List<Fetch> parsefetch(String rest) {
  //   final result = jsonDecode(rest).cast<Map<String, dynamic>>();
  //   return result.map<Fetch>((json) => Fetch.fromJson(json)).toList();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Fetch>>(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Data(fire: snapshot.data!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class Data extends StatelessWidget {
  const Data({Key? key, required this.fire}) : super(key: key);
  final List<Fetch> fire;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: fire.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(fire[index].title),
              leading: Text(fire[index].id.toString()),
              subtitle: Text(fire[index].userId.toString()),
            );
          }),
    );

    //  GridView.builder(
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //   ),
    //   itemCount: fire.length,
    //   itemBuilder: (context, index) {
    //     return Text(fire[index].title);
    //   },
    // );
  }
}
