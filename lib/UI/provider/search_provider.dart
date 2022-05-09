import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/models/lawyers_model.dart';

class Searchprovider extends ChangeNotifier {
 
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool _searchstarted = false;
  get searchstarted => _searchstarted;
  String _searchtext = "";
  get searchtext => _searchtext;
  TextEditingController _textcontroller = TextEditingController();
  get textcontroller => _textcontroller;

  Future<List> getdata() async {
    List<Lawyermodel> _data = [];
    QuerySnapshot rawdata = await firestore.collection("LawyersDB").get();

    List<DocumentSnapshot> _snap = [];
    _snap.addAll(rawdata.docs.where((datalist) =>
        datalist["name"].toLowerCase().contains(_searchtext.toLowerCase()) ||
        datalist["description"]
            .toLowerCase()
            .contains(_searchtext.toLowerCase())));
    _data = _snap.map((e) => Lawyermodel.fromFirestore(e)).toList();
    print(_data);
    return _data;
    
  }

  setsearchtext(value) {
    _textcontroller.text = value;
    _searchstarted = true;
    _searchtext = value;
    print(value);
    notifyListeners();
  }

  setsearchinit() {
    _textcontroller.clear();
    _searchstarted = false;
    notifyListeners();
  }
}
