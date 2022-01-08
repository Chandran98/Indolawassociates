import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indolawassociates/UI/components/Internet%20connectivity/Network_status.dart';
import 'package:indolawassociates/UI/components/slider/slider.dart';
import 'package:indolawassociates/UI/dummy/Mapping.dart';
import 'package:indolawassociates/UI/dummy/amppu.dart';
import 'package:provider/src/provider.dart';
// import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/UI/provider/languageprovider.dart';
import 'package:indolawassociates/UI/components/clippath.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/services/fireabase_service.dart';
import 'package:indolawassociates/UI/widgets/Lawyers/Lawyer_list.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/categories/Category_list_page.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    getusername();
  }

  GetdataFB getdataFB = GetdataFB();
  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }

  void onback() {
    AwesomeDialog(
      dialogBackgroundColor: white,
      context: context,
      dialogType: DialogType.WARNING,
      borderSide: BorderSide(color: white, width: 2),
      width: 350,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.LEFTSLIDE,
      title: 'Exit',
      desc: 'Are sure you want to exit...',
      buttonsTextStyle: dfont,
      showCloseIcon: true,
      btnCancelOnPress: () {
        Navigator.pushNamed(context, homeroute);
      },
      btnOkOnPress: () {
        SystemNavigator.pop();
      },
    )..show();
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   backgroundColor: black,
    //   content: Text(
    //     "Closing the app",
    //     style: dfont,
    //   ),
    // ));
    // Future.delayed(
    //   Duration(seconds: 2),
    //   () {
    //     SystemNavigator.pop();
    //   },
    // );
  }

  String _username = "";
  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    List language = [translate!.language1, translate.primarylanguage];
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return NetworkSensitive(
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () {
            onback();
            return Future.value(false);
          },
          child: Scaffold(
            floatingActionButton: FloatingActionButton.extended(
                label: Text(
                  translate.quickcall,
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  Icons.call,
                  size: 20,
                  color: Colors.white,
                ),
                backgroundColor: black,
                onPressed: () {
                  launcher("tel: 8940383000");
                }),
            // bottomNavigationBar: Bottombar(),
            backgroundColor: background,
            // backgroundColor: white,
            // bottomNavigationBar: Navbar(),
            body: SingleChildScrollView(
              child:
                  // Stack(children: [
                  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ClipPath(
                      //   // clipBehavior: Clip.antiAliasWithSaveLayer,
                      clipper: CustomdClipper(),
                      child: Container(
                        height: 300,
                        // width: width * 1.w,
                        decoration: new BoxDecoration(
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey,
                          //     offset: Offset(0.0, 1.0), //(x,y)
                          //     blurRadius: 6.0,
                          //   )
                          // ],
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: [0.1, 0.9],
                              colors: [green.withOpacity(.8), Colors.black]),
                        ),
                        // gradient: new LinearGradient(
                        //     colors: [
                        //   // green,
                        //   // green,
                        //   green,
                        //   Colors.white,
                        // ],
                        //     stops: [
                        //   0.0,
                        //   1.0
                        // ],
                        //     begin: FractionalOffset.centerRight,
                        //     end: FractionalOffset.centerLeft,
                        //     tileMode: TileMode.repeated)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              spaced20,
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Hi $_username",
                                        style: GoogleFonts.poppins(
                                            color: white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    // Image.asset(
                                    //   "assets/images/ILALOGO.png",
                                    //   height: height * 0.04.h,
                                    // ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              languagebutton();
                                            },
                                            icon: Image.asset(
                                              "assets/icons/lang.png",
                                              color: white,
                                            )),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, notificationroute);
                                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Mappu()));
                                            },

                                            // => Navigator.pushNamed(
                                            //     context, notificationroute),
                                            icon: SvgPicture.asset(
                                              "assets/icons/notification.svg",
                                              color: white,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              spaced10,

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: AutoSizeText(translate.hometitle,
                                    style: dfont),
                              ),
                              // SizedBox(
                              //   height: height * 0.00.h,
                              // ),
                              spaced10,
                              Center(
                                  child:
                                      Text(translate.hometitle2, style: dfont)),
                              spaced10,
                              Cateslider()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ,
                  Container(
                    child: Slisder(),
                    height: 180,
                    // width: width * 1.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28.0, vertical: 10),
                    child: Text(translate.hometitle3, style: dfont),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Relawyerlist(),
                  ),

                  //  Expanded(
                  // flex: 1,
                  // child:Democard()),
                  // Expanded(
                ],
              ),
              // ]),
            ),
          ),
        ),
      ),
    );
  }

  languagebutton() {
    final translate = AppLocalizations.of(context);

    showCupertinoDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: dialog,
              title: Text(
                translate!.languagekey,
                style: dfont,
              ),
              // actionsPadding: EdgeInsets.symmetric(horizontal: 1.w),
              actions: [
                TextButton(
                    onPressed: () {
                      context.read<Languagenotifier>().changelanguage("en");
                      Navigator.pop(context);
                    },
                    child: Text(
                      translate.primarylanguage,
                      style: dfont,
                    )),
                TextButton(
                    onPressed: () {
                      context.read<Languagenotifier>().changelanguage("ta");
                      Navigator.pop(context);
                    },
                    child: Text(
                      translate.language1,
                      style: dfont,
                    ))
              ],
            ));
  }

  getusername() {
    return FirebaseFirestore.instance
        .collection("ILA")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      if (mounted)
        setState(() {
          _username = value.data()!["name"].toString();
        });
    });
  }
}
