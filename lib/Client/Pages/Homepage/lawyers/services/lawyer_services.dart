import 'package:cloud_firestore/cloud_firestore.dart';

class LawyerDB {
  // FirebaseFirestore lawyerdb = FirebaseFirestore.instance;

  getlawyerdb() {
    return FirebaseFirestore.instance.collection("LawyersDB").snapshots();
  }
}
