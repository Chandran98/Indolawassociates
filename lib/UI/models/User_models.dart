import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  String name, imageurl, email, location, phone;

  Usermodel(
      {required this.email,
      required this.imageurl,
      required this.phone,
      required this.location,
      required this.name});

  factory Usermodel.fromFirestore(DocumentSnapshot snapshot) {
    Map map = snapshot.data() as Map<dynamic, dynamic>;
    return Usermodel(
      name:     map["name"]==null?"name":map["name"],
      imageurl: map["image"]==null?"":map["image"] ,
      location: map["location"]==null?"location":map["location"],
      email:    map["email"]==null?"email":map["email"],
      phone:    map["cellnumber"]==null?"0":map["cellnumber"],
    );
  }
}
