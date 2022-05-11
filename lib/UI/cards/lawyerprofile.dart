import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/contact_box.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/lawyers_model.dart';
import 'package:indolawassociates/UI/pages/Dashboard_screen.dart';
import 'package:indolawassociates/UI/widgets/Lawyers/Lawyer_info_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LawyerProfilePage extends StatelessWidget {
  final Lawyermodel d;
  LawyerProfilePage({
    required this.d,
  });

  @override
  Widget build(BuildContext context) {
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
    final translate = AppLocalizations.of(context);
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      // color: Colors.redAccent,
                      height: 150,
                      width: 500,
                      child: Image.asset(
                        "assets/images/intro_screen3.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: -80,
                      left: 30,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        width: 120,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 5),
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage(d.images!),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                spaced30,
                spaced20,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    children: [
                      Text(
                        d.name!,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          // color: white
                        ),
                        // style: titletextblack,
                        textAlign: TextAlign.center,
                      ),
                      // SizedBox(
                      //   height: height * 0.001.h,
                      // ),
                      Text(
                        "${d.specialized} Lawyer",
                        // style: demofont,
                      ),
                      spaced20,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Description :",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            // color: white
                          ),
                        ),
                      ),
                      spaced10,
                      AutoSizeText(
                        d.description!,
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
                          "Pratices Area :",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            // color: white
                          ),
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
                                Titlecard(title:  d.area1!),
                                Titlecard(title: d.area2!),
                                Titlecard(title: d.area3!),
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
                                Titlecard(title: d.area4!),
                                Titlecard(title: d.area5!),
                                Titlecard(title: d.area6!),
                                // Titlecard(title: "title"),
                                // Titlecard(title: "title"),
                              ],
                            ),
                          ))
                        ],
                      ),
                      Contactbox()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
