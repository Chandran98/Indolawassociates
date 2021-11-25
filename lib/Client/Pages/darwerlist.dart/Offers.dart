import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Homepage/drawer.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Maindrawer()));
  }

  @override
  Widget build(BuildContext context) {    final translate = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(    appBar: AppBar(
          elevation: 0,
          backgroundColor: navy,
          title: Text(
            translate!.drawerkey2,
            style: GoogleFonts.mulish(
                color: white, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Maindrawer())),
              icon: Icon(
                Icons.arrow_back,
                color: white,
                
              )),
        ),),
    );
  }
}
