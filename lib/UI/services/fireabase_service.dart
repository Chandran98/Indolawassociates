import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class GetdataFB {
  // FirebaseFirestore lawyerdb = FirebaseFirestore.instance;
  getusername() {
    return FirebaseFirestore.instance
        .collection("ILA")
        .doc(FirebaseAuth.instance.currentUser!.uid).snapshots();
  }

  
}
