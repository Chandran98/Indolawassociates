import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/button.dart';
import 'package:indolawassociates/UI/components/contact_box.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/UI/models/form_model.dart';
import 'package:indolawassociates/UI/pages/Servicepage/otherservices/Otherservices_form.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';

class OTherservicesinfo extends StatefulWidget {
  const OTherservicesinfo(
      {Key? key,
      required this.servicetitle,
      required this.servicecontent,
      required this.serviceimage})
      : super(key: key);

  final String servicetitle, servicecontent, serviceimage;

  @override
  _OTherservicesinfoState createState() => _OTherservicesinfoState();
}

class _OTherservicesinfoState extends State<OTherservicesinfo> {
  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }


  var whatsapp = "+91 8940383000";
  @override
  

  void onback() {
    Navigator.pushNamed(context, servicespage);
  }

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
                body: Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: IconButton(
                            iconSize: 40,
                            color: white,
                            icon: Image.asset(
                              "assets/icons/rback.png",
                              color: iconcolor,
                              height: 40,
                            ),
                            onPressed: () =>
                                Navigator.pushNamed(context, servicespage)),
                      ),
                      Expanded(
                        child: AutoSizeText(widget.servicetitle,
                            textAlign: TextAlign.center,
                            style: titletextblack),
                      )
                    ],
                  ),
                  spaced30,
                  Card(
                    elevation: 4,
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.serviceimage),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  spaced30,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      widget.servicecontent,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: black),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  spaced20,
                  TextButton(
                    onPressed: () => showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25))),
                        enableDrag: false,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: Otherservicesform(),
                              ),
                            )),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: white,
                            border: Border.all(color: black)),
                        height: 50,
                        width: 150,
                        // padding: const EdgeInsets.symmetric(
                        //   vertical: 15.0,
                        //   horizontal: 15.0,
                        // ),
                        child: Center(
                          child: Text(
                            translate!.apply,
                            style: GoogleFonts.poppins(
                                // fontWeight: FontWeight.bold,
                                color: black,
                                fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),
                  // CustomButton(
                  //   style: GoogleFonts.poppins(
                  //       // fontWeight: FontWeight.bold,
                  //       color: black,
                  //       fontSize: 11.sp),
                  //   height: height * 0.06,
                  //   text: translate!.apply,
                  //   width: width * 0.4,
                  //   onpressed: () => showModalBottomSheet(
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.vertical(
                  //               top: Radius.circular(25))),
                  //       enableDrag: false,
                  //       isScrollControlled: true,
                  //       context: context,
                  //       builder: (context) => SingleChildScrollView(
                  //             child: Container(
                  //               padding: EdgeInsets.only(
                  //                   bottom: MediaQuery.of(context)
                  //                       .viewInsets
                  //                       .bottom),
                  //               child: buildformsheet(),
                  //             ),
                  //           )),
                  // ),
                 spaced30,
                  Contactbox(),
                ],
              ),
            ),
          ),
        ))));
  }


}
