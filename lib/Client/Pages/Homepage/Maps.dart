import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import '../../../main.dart';
import 'package:geolocator/geolocator.dart';

class Maped extends StatefulWidget {
  const Maped({Key? key}) : super(key: key);

  @override
  _MapedState createState() => _MapedState();
}

class _MapedState extends State<Maped> {
  @override
  void initState() {
    super.initState();
    getuserlocation(location);
  }
    String place ="";
  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Mainhome()));
  }
var location;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: navy,
            title: Text("Maps", style: GoogleFonts.mulish(color: white)),
            leading: IconButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Mainhome())),
                icon: Icon(Icons.arrow_back)),
          ),
          body: Column(
            children: [
              Container(child: Text(place),),
              Center(
                child: FlatButton(
                    onPressed: () async {
                      Position position = await _determinePosition();
                      place=position.latitude.toString() ;
                    },
                    child: Text("Map")),
              ),
            ],
          )),
    );
  }

  Future<void> getuserlocation(location) async {
    location=place;
    CollectionReference currentlocation =
        FirebaseFirestore.instance.collection("location");
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    String username = auth.currentUser!.email.toString();
    currentlocation.add({"location": location, "uid": uid, "name": username});
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
