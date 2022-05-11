import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class GetdataFB {
  // FirebaseFirestore lawyerdb = FirebaseFirestore.instance;
  getusername() {
    return FirebaseFirestore.instance
        .collection("ILA")
        .doc(FirebaseAuth.instance.currentUser!.uid).snapshots();
  }

  
}

class LawyerDB {
  // FirebaseFirestore lawyerdb = FirebaseFirestore.instance;

  getlawyerdb() {
    return FirebaseFirestore.instance.collection("LawyersDB").snapshots();
  }
}



class FirebaseApi{

  static UploadTask? uploadadhar(String destination,File reqfile){

    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(reqfile);
    } catch (e) {
      return null;
    }
  }

  
  static UploadTask? uploadenrollmentid(String destination,File enrollmentid){

    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(enrollmentid);
    } catch (e) {
      return null;
    }
  }
}