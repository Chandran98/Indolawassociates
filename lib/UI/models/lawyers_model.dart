import 'package:cloud_firestore/cloud_firestore.dart';

class Lawyermodel {
  String? specialized,
      place,
      name,
      experience,
      images,
      description,
      area1,
      area3,
      area2,
      area4,
      area5,
      area6;

  Lawyermodel(
      {this.area1,
      this.area2,
      this.area3,
      this.area4,
      this.area5,
      this.area6,
      this.description,
      this.experience,
      this.images,
      this.name,
      this.place,
      this.specialized});

  factory Lawyermodel.fromFirestore(DocumentSnapshot snapshot) {
    Map map = snapshot.data() as Map<dynamic, dynamic>;
    return Lawyermodel(
      description: map["description"],
      // experience: map["experience"],
      images: map["images"],
      name: map["name"],
      place: map["place"],
      specialized: map["specialized"],
      area1: map["area1"],
      area2: map["area2"],
      area3: map["area3"],
      area4: map["area4"],
      area5: map["area5"],
      area6: map["area6"],
    );
  }
}
