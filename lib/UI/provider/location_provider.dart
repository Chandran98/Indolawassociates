import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Locationprovider with ChangeNotifier {
  double? longitude;
  double? latitude;
  bool permissionallowed = false;
  String? selectedAddress;

  Future<void> getcurrentlocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (position != null) {
      this.longitude = position.longitude;
      this.latitude = position.latitude;
      this.permissionallowed = true;

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark newPlacemark = placemarks.first;
      selectedAddress = newPlacemark.subLocality! +
          '\t' +
          newPlacemark.thoroughfare! +
          '\t' +
          newPlacemark.name! +
          '\n' +
          newPlacemark.locality! +
          '\t' +
          newPlacemark.postalCode!;
      notifyListeners();
    } else {
      print("Error");
    }
  }

  void oncameramove(CameraPosition cameraPosition) async {
    this.latitude = cameraPosition.target.latitude;
    this.longitude = cameraPosition.target.longitude;
    notifyListeners();
  }

  Future<void> getaddress() async {
    
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark newPlacemark = placemarks.first;
    selectedAddress = newPlacemark.street! +
        '\t' +
        newPlacemark.subLocality! +
        '\t' +
        newPlacemark.thoroughfare! +
        '\n' +
        newPlacemark.locality! +
        '\t' +
        newPlacemark.postalCode! +
        '\t';
    notifyListeners();

    print("${selectedAddress}");
  }
}
