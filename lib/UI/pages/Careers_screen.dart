import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/UI/pages/Settingspage/careers/Careers_form.dart';
import 'package:indolawassociates/UI/routes/route.dart';

class Careerspage extends StatefulWidget {
  Careerspage({Key? key}) : super(key: key);

  @override
  _CareerspageState createState() => _CareerspageState();
}

class _CareerspageState extends State<Careerspage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool color = false;
  var careersopt;
  var preferedarea;
  List careersoptlist = ["Full Time", "Part Time", "Case Based only"];
  List preferedarealist = [
    "Property",
    "Family",
    "Criminal",
    "Corporate",
    " Cyber Crime",
    "Civil",
    " Taxation",
    "Labour",
    "Consumer"
  ];

  final _namecontroller = TextEditingController();
  final _employeeidcontroller = TextEditingController();
  final _specializationcontroller = TextEditingController();
  final _mobilecontroller = TextEditingController();
  final _experiencecontroller = TextEditingController();
  // final _preferedareacontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _contactaddresscontroller = TextEditingController();
  final _dobcontroller = TextEditingController();

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    _namecontroller.dispose();
    _employeeidcontroller.dispose();
    _specializationcontroller.dispose();
    _mobilecontroller.dispose();
    _experiencecontroller.dispose();
    // _preferedareacontroller.dispose();
    _addresscontroller.dispose();
    _contactaddresscontroller.dispose();
    _dobcontroller.dispose();
  }

  File? reqfile;
  File? enrollmentid;
  var pickfile;
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    final translate = AppLocalizations.of(context);
    void onback() {
      Navigator.pushNamed(context, settingsroute);
    }

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Container(
                          child: IconButton(
                              iconSize: 40,
                              color: white,
                              icon: Image.asset(
                                "assets/icons/rback.png",
                                color: iconcolor,
                                height: 40,
                              ),
                              onPressed: () =>
                                  Navigator.pushNamed(context, settingsroute)),
                        ),
                      ),  
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          translate!.drawerkey7,
                                         style: titletextblack,textAlign: TextAlign.center,

                        ),
                      )
                    ],
                  ),
                  spaced10,
                  Container(
                    height:200,
                    // width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: AssetImage("assets/images/COD.jpg"),
                            fit: BoxFit.cover)),
                  ),
                 spaced30,
                  Text(
                    translate.career4,
                    style: demofont
                  ),
                  spaced10,
                  Text(
                    translate.career5, textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    // textScaleFactor: 1,
                  ),
                 spaced10,
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
                                // child: formsheet(context),
                                                                child: Careersform()
                              ),
                            )),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: white,
                            border: Border.all(color: navy)),
                        height:55,
                        width: 150,
                        // padding: const EdgeInsets.symmetric(
                        //   vertical: 15.0,
                        //   horizontal: 15.0,
                        // ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              translate.career1,
                              style: demofont,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
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
