import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/pages/Business.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/pages/Company_laws.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/pages/Comsumer_laws.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/pages/Criminal_laws.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/pages/Deeds.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/pages/Family_laws.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/pages/Gifts.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/pages/Mortgage.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/pages/Partition.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/pages/Partnership.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/pages/Sales.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/pages/Trust_Agreement.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/pages/Will.dart';
import 'package:indolawassociates/Client/constants/constant.dart';

import '../../../main.dart';

class Legal extends StatefulWidget {
  const Legal({Key? key}) : super(key: key);

  @override
  _LegalState createState() => _LegalState();
}

class _LegalState extends State<Legal> {
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
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: navy,
            title: Text(
              "Legal Forms",
              style: GoogleFonts.mulish(
                  color: white, fontWeight: FontWeight.w500, fontSize: 21),
            ),
            leading: IconButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Mainhome())),
                icon: Icon(
                  Icons.arrow_back,
                  color: white,
                )),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  ListTile(
                    leading: Icon(Icons.logout, color: navy),
                    title: Text(
                      "Forms Related to Trust Agreements",
                      style: hStyle,
                    ),
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Trustlegalforms())),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: navy),
                    title: Text(
                      "Forms Related to Will",
                      style: hStyle,
                    ),
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Willlegalforms())),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: navy),
                    title: Text(
                      "Forms Related to Business",
                      style: hStyle,
                    ),
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Businesslegalforms())),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: navy),
                    title: Text(
                      "Forms Related to Company Laws",
                      style: hStyle,
                    ),
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Companylegalforms())),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: navy),
                    title: Text(
                      "Forms Related to Consumer Laws",
                      style: hStyle,
                    ),
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Consumerlegalforms())),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: navy),
                    title: Text(
                      "Forms Related to Criminal Laws",
                      style: hStyle,
                    ),
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Criminallegalforms())),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: navy),
                    title: Text(
                      "Forms Related to Family Laws",
                      style: hStyle,
                    ),
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Familylegalforms())),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: navy),
                    title: Text(
                      "Forms Related to Deeds",
                      style: hStyle,
                    ),
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Deedslegalforms())),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: navy),
                    title: Text(
                      "Forms Related to Gifts",
                      style: hStyle,
                    ),
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Giftslegalforms())),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: navy),
                    title: Text(
                      "Forms Related to Mortgage",
                      style: hStyle,
                    ),
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Mortgagelegalforms())),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: navy,
                    ),
                    title: Text(
                      "Forms Related to Partition",
                      style: hStyle,
                    ),
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Partitionlegalforms())),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: navy),
                    title: Text(
                      "Forms Related to Partnership",
                      style: hStyle,
                    ),
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Partnershiplegalforms())),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: navy),
                    title: Text(
                      "Forms Related to Sales",
                      style: hStyle,
                    ),
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => saleslegalforms())),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
