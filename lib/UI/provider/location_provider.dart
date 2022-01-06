import 'dart:html';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

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
      selectedAddress = newPlacemark.locality! +
          '\n' +
          newPlacemark.street! +
          '\t' +
          newPlacemark.subLocality! +
          '\t' +
          newPlacemark.thoroughfare! +
          '\t' +
          newPlacemark.name! +
          '\t' +
          newPlacemark.postalCode!;
      notifyListeners();
    } else {
      print("Error");
    }
  }


 Future<void> getaddress() async {
   
   
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark newPlacemark = placemarks.first;
    selectedAddress = newPlacemark.locality! +
        '\n' +
        newPlacemark.street! +
        '\t' +
        newPlacemark.subLocality! +
        '\t' +
        newPlacemark.thoroughfare! +
        '\t' +
        newPlacemark.name! +
        '\t' +
        newPlacemark.postalCode!;
    notifyListeners();

    print("${selectedAddress}");
  }
  
}
