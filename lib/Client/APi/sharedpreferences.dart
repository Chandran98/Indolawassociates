import 'package:indolawassociates/Client/model/Profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profilestorage {
  Future saveprofile(Profile profile) async {
    final shared = await SharedPreferences.getInstance();

    shared.setString("username", profile.username);
    shared.setString("email", profile.email);
    shared.setString("address1", profile.address1);
    shared.setString("address2", profile.address2);
    shared.setString("phone", profile.phone);
  }

  getprofile() async {
    final shared = await SharedPreferences.getInstance();

    final username = shared.getString("username");
    final email = shared.getString("email");
    final address1 = shared.getString("address1");
    final address2 = shared.getString("address2");

    final phone = shared.getString("phone");

    return Profile(
        address1: address1.toString(),
        address2: address2.toString(),
        username: username.toString(),
        phone: phone.toString(),
        email: email.toString());
  }
}
