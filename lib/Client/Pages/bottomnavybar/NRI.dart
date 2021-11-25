import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';

import '../../../main.dart';

class NRI extends StatelessWidget {
  const NRI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
          backgroundColor: navy,
          title: Text(
            "NRI",
            style: GoogleFonts.mulish(
                color: white, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Mainhome())),
              icon: Icon(
                Icons.arrow_back,
                color: white,
              )),
        ),);
  }
}