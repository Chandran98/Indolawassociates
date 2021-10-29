import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indolawassociates/Client/components/searchbarmap.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import '../../../main.dart';


class Maped extends StatefulWidget {
  const Maped({Key? key}) : super(key: key);

  @override
  _MapedState createState() => _MapedState();
}

class _MapedState extends State<Maped> {
  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Mainhome()));
  }

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
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Mainhome())),
              icon: Icon(Icons.arrow_back)),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 1,
              child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(13.0827, 80.2707), zoom: 15)),
            ),
            Positioned(top: 25, left: 52, child: SearchBarmap()),
          ],
        ),
      ),
    );
  }
}
