import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/button.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/form_model.dart';
import 'package:indolawassociates/UI/pages/Servicepage/Paralegal/Paralegal_form.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ParalegalPage extends StatefulWidget {
  const ParalegalPage(
      {Key? key, required this.Paralegaltitle, required this.paralegalcontent})
      : super(key: key);

  final String Paralegaltitle, paralegalcontent;

  @override
  _ParalegalPageState createState() => _ParalegalPageState();
}

class _ParalegalPageState extends State<ParalegalPage> {
  void onback() {
    Navigator.pushNamed(context, servicespage);
  }

  var whatsapp = "+91 8940383000";

  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
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
                // appBar: AppBar(
                //   toolbarHeight: MediaQuery.of(context).size.height * 0.065.h,
                //   backgroundColor: white,
                //   title: Text(widget.Paralegaltitle,
                //       style: GoogleFonts.mulish(
                //           fontSize: 18.5.sp,
                //           fontWeight: FontWeight.w500,
                //           color: navy)),
                //   leading: IconButton(
                //       onPressed: () => Navigator.pushReplacement(context,
                //           MaterialPageRoute(builder: (context) => TParalegal())),
                //       icon: Icon(
                //         Icons.arrow_back,
                //         color: navy,
                //       )),
                // ),
                // floatingActionButton: FloatingActionButton.extended(
                //   backgroundColor: gold,
                //   onPressed: () => showModalBottomSheet(
                //       shape: RoundedRectangleBorder(
                //           borderRadius:
                //               BorderRadius.vertical(top: Radius.circular(25))),
                //       enableDrag: false,
                //       isScrollControlled: true,
                //       context: context,
                //       builder: (context) => SingleChildScrollView(
                //             child: Container(
                //               padding: EdgeInsets.only(
                //                   bottom: MediaQuery.of(context).viewInsets.bottom),
                //               child: buildformsheet(),
                //             ),
                //           )),
                //   label: Text(
                //     translate!.apply,
                //   ),
                //   icon: Icon(Icons.arrow_back_ios_new_rounded),
                // ),
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
                              height: 35,
                            ),
                            onPressed: () =>
                                Navigator.pushNamed(context, servicespage)),
                      ),
                      Expanded(
                        child: AutoSizeText(widget.Paralegaltitle,
                            textAlign: TextAlign.center, style: titletextblack),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/intro_screen3.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      widget.paralegalcontent,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: black),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

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
                                child: Paralegalform(),
                              ),
                            )),
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
                  SizedBox(
                    height: 20,
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
                    translate.drawerkey5,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        // fontWeight: FontWeight.bold,
                        color: black,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          launcher("tel: 8940383000");
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                border: Border.all(color: navy)),
                            height: 50,
                            width: 160,
                            // padding: const EdgeInsets.symmetric(
                            //   vertical: 15.0,
                            //   horizontal: 15.0,
                            // ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
              ),
            ),
          ),
        )

                // SingleChildScrollView(
                //     child: Stack(
                //   children: [
                //     Container(
                //       height: MediaQuery.of(context).size.height * 0.25.h,
                //       decoration: BoxDecoration(
                //           image: DecorationImage(
                //               image: AssetImage("assets/images/intro_screen3.jpg"),
                //               fit: BoxFit.cover)),
                //     ),
                //     // Padding(
                //     //   padding: const EdgeInsets.symmetric(vertical:500.0),
                //     //   child:
                //     // )
                //     Padding(
                //       padding: const EdgeInsets.only(top: 170.0),
                //       child: Container(
                //         height: MediaQuery.of(context).size.height * 0.58.h,
                //         decoration: BoxDecoration(
                //             color: white,
                //             borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(22),
                //               topRight: Radius.circular(22),
                //             )),
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Padding(
                //             padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                //             child: Column(
                //               children: [
                //                 Text(
                //                   widget.Paralegaltitle,
                //                   style: bStyle,
                //                   textScaleFactor: 1,
                //                 ),

                //                 // Text("Experience ${toplawyerlist.Experience}",style: hStyle,),
                //                 // Text(
                //                 //   "toplawyerlist.type",
                //                 //     style: GoogleFonts.mulish(
                //                 //         fontWeight: FontWeight.w600,
                //                 //         fontSize: 16,
                //                 //         color: navy)),
                //                 SizedBox(
                //                   height: MediaQuery.of(context).size.height * 0.03.h,
                //                 ),
                //                 Text(
                //                   widget.paralegalcontent,
                //                   style: GoogleFonts.mulish(
                //                       fontWeight: FontWeight.w600,
                //                       fontSize: 13.sp,
                //                       color: navy),
                //                   textAlign: TextAlign.justify,
                //                   textScaleFactor: 1,
                //                 ),
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     SizedBox(
                //                       height:
                //                           MediaQuery.of(context).size.height * 0.02.h,
                //                     ),
                //                     Text(
                //                       translate.drawerkey5,
                //                       style: GoogleFonts.mulish(
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 17.sp,
                //                           color: gold),
                //                       textAlign: TextAlign.justify,
                //                       textScaleFactor: 1,
                //                     ),
                //                     SizedBox(
                //                       height: MediaQuery.of(context).size.height *
                //                           0.015.h,
                //                     ),
                //                     InkWell(
                //                       onTap: () {
                //                         launcher(
                //                             "mailto: indolawassociates@gmail.com");
                //                       },
                //                       child: Row(
                //                         children: [
                //                           Icon(
                //                             Icons.mail,
                //                             color: navy,
                //                           ),
                //                           SizedBox(
                //                             width: 10,
                //                           ),
                //                           Text(
                //                             "info@indolawassociates.com",
                //                             style: GoogleFonts.mulish(
                //                                 fontWeight: FontWeight.w600,
                //                                 fontSize: 15.sp,
                //                                 color: navy),
                //                             textAlign: TextAlign.justify,
                //                             textScaleFactor: 1,
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                     SizedBox(
                //                       height:
                //                           MediaQuery.of(context).size.height * 0.01.h,
                //                     ),
                //                     InkWell(
                //                       onTap: () {
                //                         launcher("tel: 8940383000");
                //                       },
                //                       child: Row(
                //                         children: [
                //                           Icon(
                //                             Icons.call_sharp,
                //                             color: navy,
                //                           ),
                //                           SizedBox(
                //                             width: 10,
                //                           ),
                //                           Text(
                //                             "8940383000",
                //                             style: GoogleFonts.mulish(
                //                                 fontWeight: FontWeight.w600,
                //                                 fontSize: 15.sp,
                //                                 color: navy),
                //                             textAlign: TextAlign.justify,
                //                             textScaleFactor: 1,
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                     SizedBox(
                //                       height:
                //                           MediaQuery.of(context).size.height * 0.01.h,
                //                     ),
                //                     Row(
                //                       children: [
                //                         Icon(
                //                           Icons.timer_rounded,
                //                           color: navy,
                //                         ),
                //                         SizedBox(
                //                           width: 10,
                //                         ),
                //                         FittedBox(
                //                           child: Text(
                //                             "${translate.workingshift}: 8am-6pm",
                //                             style: GoogleFonts.mulish(
                //                                 fontWeight: FontWeight.w600,
                //                                 fontSize: 15.sp,
                //                                 color: navy),
                //                             textAlign: TextAlign.justify,
                //                             textScaleFactor: 1,
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // )),

                )));
  }

}
