import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/components/contact_box.dart';
import 'package:indolawassociates/UI/components/slider/slider.dart';
// import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';

class NRIsection extends StatefulWidget {
  NRIsection({Key? key}) : super(key: key);

  @override
  _NRIsectionState createState() => _NRIsectionState();
}

class _NRIsectionState extends State<NRIsection> {
  onback() {
    Navigator.pushNamed(context, homeroute);
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
    final translate = AppLocalizations.of(context);
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   elevation: 3,
          //   toolbarHeight: 60.h,
          //   centerTitle: true,
          //   backgroundColor: dialog,
          //   title: Text(
          //     translate!.navkey4,
          //     style: GoogleFonts.poppins(
          //         color: white, fontWeight: FontWeight.w500, fontSize: 20.sp),
          //   ),
          //   leading: IconButton(
          //       onPressed: () => Navigator.pushNamed(context, homeroute),
          //       icon: Image.asset(
          //         "assets/icons/rback.png",
          //         color: white,
          //         height: 35,
          //       )),
          // ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 spaced20,
                  Container(
                    child: Slisder(),
                    height: 140,
                    // width: width * 1.w,
                  ),
                  spaced20,
                  Text(translate!.welcomenri,textAlign: TextAlign.center,
                    style: titletextblack,
                  ),
                  spaced20,
                  Text(
                   translate.nripara1, textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),textScaleFactor: 0.9,
                  ),
                spaced20,
                  Text(
                   translate.nripara3, textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),textScaleFactor: 0.9,
                  ),
                  spaced30,
                  Text(
                  translate.nripara2,  textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),textScaleFactor: 0.9,
                  ),
                 
                  spaced20,
          Contactbox()    ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
