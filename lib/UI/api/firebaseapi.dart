
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

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