import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/provider/languageprovider.dart';
import 'package:indolawassociates/Client/utils/Internet%20connectivity/Network_status.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/src/provider.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Settingspage extends StatefulWidget {
  // static const String id = "settings-page";
  Settingspage({Key? key}) : super(key: key);

  @override
  _SettingspageState createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  String _username = "";
  String _mobilenumber = "";
  String _email = "";
  String _location = "";
  @override
  void initState() {
    super.initState();
    getuser();
  }

  void onback() {
    Navigator.pushNamed(context, homeroute);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final translate = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: NetworkSensitive(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: black,
            floatingActionButton: FloatingActionButton.extended(
                label: Text(
                  translate!.drawerkey6,
                  style: GoogleFonts.poppins(
                      color: black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500),
                ),
                icon: Icon(
                  Icons.logout,
                  size: 20.r,
                  color: Colors.black,
                ),
                backgroundColor: white,
                onPressed: () {
                  _auth.signOut().then(
                      (value) => Navigator.pushNamed(context, loginpageroute));
                }),
            body: SingleChildScrollView(
              child: Container(
                width: width,
                color: black,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              child: IconButton(
                                  iconSize: 40.r,
                                  color: white,
                                  icon: Image.asset(
                                    "assets/icons/rback.png",
                                    color: white,
                                    height: 40.h,
                                  ),

                                  // onPressed: () => pushNewScreenWithRouteSettings(
                                  //     context,
                                  //     screen: Testingpage(),
                                  //     settings:
                                  //         RouteSettings(name: Testingpage.id)),
                                  onPressed: () =>
                                      Navigator.pushNamed(context, homeroute)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Container(
                              child: IconButton(
                                  iconSize: 40.r,
                                  color: white,
                                  icon: Image.asset(
                                    "assets/icons/edit.png",
                                    color: white,
                                    height: 24.h,
                                  ),
                                  onPressed: () {}),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1.h,
                        width: MediaQuery.of(context).size.width * 0.25.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/icons/user.png"),
                              fit: BoxFit.cover,
                            ),
                            color: white),
                      ),
                      SizedBox(
                        height: height * 0.015.h,
                      ),
                      Text(
                        _username,
                        style: GoogleFonts.mulish(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: height * 0.005.h,
                      ),
                      Text(
                        _mobilenumber,
                        style: GoogleFonts.mulish(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: height * 0.005.h,
                      ),
                      Text(
                        _email,
                        style: GoogleFonts.mulish(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: height * 0.005.h,
                      ),
                      Text(
                        _location,
                        style: GoogleFonts.mulish(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: height * 0.005.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02.h,
                            ),
                            ListTile(
                              leading: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/icons/offer.png",
                                    color: white,
                                    height: 20,
                                  )),
                              title: Text(translate.drawerkey2,
                                  textScaleFactor: 1, style: dfont),
                              onTap: () =>
                                  Navigator.pushNamed(context, offerroute),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(
                                color: divcolor,
                              ),
                            ),
                            ListTile(
                              leading: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/icons/services.png",
                                    color: white,
                                    height: 20,
                                  )),
                              title: Text(translate.drawerkey3,
                                  textScaleFactor: 1, style: dfont),
                              onTap: () => Navigator.pushNamed(
                                  context, otherserviceroute),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(
                                color: divcolor,
                              ),
                            ),
                            ListTile(
                              leading: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    CupertinoIcons.person_3_fill,
                                    color: white,
                                  )
                                  // Image.asset(
                                  //   "assets/icons/career.png",
                                  //   color: iconcolor,
                                  //   height: 20,
                                  // )
                                  ),
                              title: Text(translate.navkey4,
                                  textScaleFactor: 1, style: dfont),
                              onTap: () =>
                                  Navigator.pushNamed(context, nriroute),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(
                                color: divcolor,
                              ),
                            ),
                            ListTile(
                              leading: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/icons/career.png",
                                    color: white,
                                    height: 20,
                                  )),
                              title: Text(translate.drawerkey7,
                                  textScaleFactor: 1, style: dfont),
                              onTap: () =>
                                  Navigator.pushNamed(context, careersroute),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(
                                color: divcolor,
                              ),
                            ),
                            ListTile(
                              leading: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/icons/lang.png",
                                    color: white,
                                    height: 20,
                                  )),
                              title: Text(translate.drawerkey4,
                                  textScaleFactor: 1, style: dfont),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text(
                                            translate.languagekey,
                                            style: demofont,
                                          ),
                                          actionsPadding: EdgeInsets.symmetric(
                                              horizontal: 30.w),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  context
                                                      .read<Languagenotifier>()
                                                      .changelanguage("en");
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  translate.primarylanguage,
                                                  style: demofont,
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  context
                                                      .read<Languagenotifier>()
                                                      .changelanguage("ta");
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  translate.language1,
                                                  style: demofont,
                                                ))
                                          ],
                                        ));
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(
                                color: divcolor,
                              ),
                            ),
                            ListTile(
                              leading: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/icons/contact.png",
                                    color: white,
                                    height: 20,
                                  )),
                              title: Text(translate.cpage,
                                  textScaleFactor: 1, style: dfont),
                              onTap: () =>
                                  Navigator.pushNamed(context, contactroute),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 20),
                            //   child: Divider(
                            //     color: divcolor,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getuser() async {
    FirebaseFirestore.instance
        .collection("ILA")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      if (mounted)
        setState(() {
          _username = value.data()!["name"].toString();
          _email = value.data()!["email"].toString();
          _location = value.data()!["location"].toString();
          _mobilenumber = value.data()!["cellnumber"].toString();
        });
    });
  }
}
