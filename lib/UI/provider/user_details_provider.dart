import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:indolawassociates/UI/models/User_models.dart';

class Userprovider with ChangeNotifier {
  Usermodel? currentdata;
  Usermodel? get currentcuserdata => currentdata;
  Userprovider() {
    getuserdata();
  }

  Future<void> getuserdata() async {
    Usermodel usermodel;
    var data = await FirebaseFirestore.instance
        .collection("ILA")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (data.exists) {
      usermodel = Usermodel(
          email: data.get("email")    ,
          
          imageurl: data.get("image")  ,
          location: data.get("location"),
          name:    data.get("name")     ,
          phone:   data.get("cellnumber"));
      currentdata = usermodel;
      notifyListeners();
    }
  }}

