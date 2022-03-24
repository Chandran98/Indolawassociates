import 'package:indolawassociates/UI/provider/user_details_provider.dart';

class Usermodel {
  String name;
  String imageurl;
  String email;
  String location;
  Usermodel(
      {required this.email,
      required this.imageurl,
      required this.location,
      required this.name});
}
