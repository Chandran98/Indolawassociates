import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Mapping extends StatefulWidget {
  Mapping({Key? key}) : super(key: key);

  @override
  _MappingState createState() => _MappingState();
}

class _MappingState extends State<Mapping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
      ),
    );
  }

  Future<void>getuserlocation(location)async{
    CollectionReference currentlocation= FirebaseFirestore.instance.collection("location");
    FirebaseAuth auth=FirebaseAuth.instance;
    String uid=auth.currentUser!.uid.toString();
    String username=auth.currentUser!.displayName.toString();
    currentlocation.add({"location":location,"uid":uid,"name":username});
  }
}
