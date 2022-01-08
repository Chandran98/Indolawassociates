import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/contact_box.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/MainHomePage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Lawyerinfocard extends StatefulWidget {
  Lawyerinfocard({required this.area1,
      required this.area2,
      required this.area3,
      required this.area4,
      required this.area5,
      required this.area6,
      required this.name,
      required this.images,
      required this.specialized,
      required this.description});
  final String name,
      specialized,
      description,
      images,
      area1,
      area2,
      area3,
      area4,
      area5,
      area6;

  @override
  _LawyerinfocardState createState() => _LawyerinfocardState();
}

class _LawyerinfocardState extends State<Lawyerinfocard> {
  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainHomepage()));
  }

  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }
  var whatsapp = "+91 8940383000";

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    final translate = AppLocalizations.of(context);
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          // floatingActionButton: FloatingActionButton.extended(
          //     backgroundColor: black,
          //     onPressed: () {
          //       launcher("tel: 8940383000");
          //     },
          //     icon: Icon(Icons.call),
          //     label: Text(
          //       "Book Appointment",
          //       // style: dfont,
          //     )),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: IconButton(
                            iconSize: 40,
                            // color: navy,
                            icon: Image.asset(
                              "assets/icons/rback.png",
                              color: iconcolor,
                              height: 35,
                            ),
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainHomepage()))),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text("Lawyer info",                style: titletextblack,textAlign: TextAlign.center,
),
                      )
                    ],
                  ),
                  spaced10,
                  Container(
                    height:150,
                    width: 300,
                    decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(widget.images),
                          fit: BoxFit.contain,
                        ),
                        color: white),
                  ),
                  spaced10,
                  Text(
                    widget.name,
                style: titletextblack,textAlign: TextAlign.center,
                  ),
                  // SizedBox(
                  //   height: height * 0.001.h,
                  // ),
                  Text(
                    "${widget.specialized} Lawyer",
                    style: demofont,
                  ),
                  spaced20,
                  AutoSizeText(
                    widget.description,
                    style: GoogleFonts.poppins(
                      // fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.justify,
                    textScaleFactor: 1,
                  ),
                 spaced10,
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Pratices Area",
                      style: demofont
                    ),
                  ),
                 spaced10,
                  Row(
                    children: [
                      Expanded(
                          // flex: 1,
                          child: Container(
                        // color: navy,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Titlecard(title: widget.area1),
                            Titlecard(title: widget.area2),
                            Titlecard(title: widget.area3),
                            // Titlecard(title: "title"),
                            // Titlecard(title: "title"),
                          ],
                        ),
                      )),
                      Expanded(
                          // flex: 1,
                          child: Container(
                        // color: green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Titlecard(title: widget.area4),
                            Titlecard(title: widget.area5),
                            Titlecard(title: widget.area6),
                            // Titlecard(title: "title"),
                            // Titlecard(title: "title"),
                          ],
                        ),
                      ))
                    ],
                  ),
          Contactbox()      ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Titlecard extends StatelessWidget {
  Titlecard({required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Icon(Icons.check, color: gold),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 13, color: black),
            ),
          ),
        ],
      ),
    );
  }
}
