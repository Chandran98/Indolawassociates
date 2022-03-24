import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class Userprovider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? _uid;
  String get uid => _uid!;

  String? _name;
  String get name => _name!;
  String? _location;
  String get location => _location!;
  String? _email;

  get email => _email;
  String? _imageurl;
  get imageurl => _imageurl;

  Future getuser() async {
    await firestore
        .collection("ILA")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _uid = snapshot["uid"];
      _email = snapshot["email"];
      _imageurl = snapshot["image"];
      _name = snapshot["name"];
      _location = snapshot["location"];
    });
    notifyListeners();
  }
}
