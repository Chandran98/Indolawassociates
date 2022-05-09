import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:indolawassociates/UI/models/lawyers_model.dart';

class Lawyerprovider extends ChangeNotifier {
  Lawyerprovider() {
    getdata();
  }
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Lawyermodel> _lawyerlist = [];
  List<Lawyermodel> get lawyerlist => _lawyerlist;
  

  Future getdata() async {
    QuerySnapshot data = await firestore.collection("LawyersDB").get();
    List<DocumentSnapshot> snapshot = [];
    snapshot.addAll(data.docs);
    _lawyerlist = snapshot.map((e) => Lawyermodel.fromFirestore(e)).toList();
    notifyListeners();
  }

  onrefresh() {
    _lawyerlist.clear();
    getdata();
    notifyListeners();
  }
}
