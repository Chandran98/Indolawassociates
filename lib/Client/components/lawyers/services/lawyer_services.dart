import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class LawyerDB {
  // FirebaseFirestore lawyerdb = FirebaseFirestore.instance;

  getlawyerdb() {
    return FirebaseFirestore.instance.collection("LawyersDB").snapshots();
  }
}
