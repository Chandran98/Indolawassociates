import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Contactbox extends StatelessWidget {
  const Contactbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var whatsapp = "+91 8940383000";
    final translate = AppLocalizations.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Divider(
            color: divcolor,
          ),
        ),
        // SizedBox(
        //   height: 10,
        // ),
        Text(
          translate!.drawerkey5,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              // fontWeight: FontWeight.bold,
              color: black,
              fontSize: 16),
        ),
       spaced10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                launch("tel: 8940383000");
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: white,
                      border: Border.all(color: navy)),
                  height: 50,
                  width: 160,
                  // padding: const EdgeInsets.symmetric(
                  //   vertical: 15.0,
                  //   horizontal: 15.0,
                  // ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/icons/call.png",
                          color: black,
                          height: 25,
                        ),
                        Text(
                          translate.mobile,
                          style: GoogleFonts.poppins(
                              // fontWeight: FontWeight.bold,
                              color: black,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )),
            ),

            TextButton(
              onPressed: () async => await launch(
                  "https://wa.me/$whatsapp?text= Hi, I have an emergency"),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: white,
                      border: Border.all(color: black)),
                  height: 50,
                  width: 160,
                  // padding: const EdgeInsets.symmetric(
                  //   vertical: 15.0,
                  //   horizontal: 15.0,
                  // ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FaIcon(
                          (FontAwesomeIcons.whatsapp),
                          color: Colors.green,
                        ),
                        AutoSizeText(
                          translate.whatsapp,
                          style: GoogleFonts.poppins(
                              // fontWeight: FontWeight.bold,
                              color: black,
                              fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )),
            ),

            //   , CustomButton(
            // height: height * 0.06,
            //     text: "Email us",
            //     width: width*0.35,
            //     onpressed: (){},
            //     style: GoogleFonts.poppins(
            //   // fontWeight: FontWeight.bold,
            //   color: black,
            //   fontSize: 12.sp),)
          ],
        )
      ],
    );
  }
}
