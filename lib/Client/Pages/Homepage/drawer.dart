import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Register_Login_screen/Login/Login_page.dart';
import 'package:indolawassociates/Client/Pages/darwerlist.dart/Careers/Careers.dart';
import 'package:indolawassociates/Client/Pages/darwerlist.dart/Contact.dart';
import 'package:indolawassociates/Client/Pages/darwerlist.dart/Offers.dart';
import 'package:indolawassociates/Client/Pages/darwerlist.dart/Otherservices.dart';
import 'package:indolawassociates/Client/Pages/darwerlist.dart/Profile/ProfilePage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/provider/languageprovider.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var username = '';

class Maindrawer extends StatefulWidget {
  @override
  _MaindrawerState createState() => _MaindrawerState();
}

class _MaindrawerState extends State<Maindrawer> {
  // alert() {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         final translate = AppLocalizations.of(context);

  //         return AlertDialog(
  //           contentPadding: EdgeInsets.all(18),
  //           elevation: 10,
  //           title: Expanded(
  //             child: Text(
  //               translate!.logoutkey,
  //               style: GoogleFonts.mulish(
  //                 fontSize: 17.sp,
  //                 fontWeight: FontWeight.bold,
  //                 color: navy,
  //               ),
  //               textScaleFactor: 1,
  //             ),
  //           ),
  //           actions: [
  //             // ignore: deprecated_member_use
  //             FlatButton(
  //                 onPressed: () {
  //                   _auth.signOut().then((value) => Navigator.pushReplacement(
  //                       context,
  //                       MaterialPageRoute(
  //                           builder: (BuildContext context) => Loginpage())));
  //                 },
  //                 child: Text(
  //                   translate.yes,
  //                   style: hStyle,
  //                   textScaleFactor: 1,
  //                 )),
  //             // ignore: deprecated_member_use
  //             FlatButton(
  //                 onPressed: () => Navigator.pushReplacement(context,
  //                     MaterialPageRoute(builder: (context) => Maindrawer())),
  //                 child: Text(
  //                   translate.no,
  //                   style: hStyle,
  //                   textScaleFactor: 1,
  //                 ))
  //           ],
  //         );
  //       });
  // }

  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Mainhome()));
  }

  @override
  void initState() {
    getdata();

    super.initState();
  }

  String _username = "";
  String _phone = "";
  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    return WillPopScope(onWillPop: () {
      onback();
      return Future.value(false);
    }, child: Consumer<Languagenotifier>(
      builder: (context, provider, snapshot) {
        return Drawer(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      height: MediaQuery.of(context).size.height * 0.2.h,
                      color: navy.withOpacity(0.95),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.08.h,
                                width:
                                    MediaQuery.of(context).size.width * 0.25.w,
                                decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.white, width: 5),

                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/drawerimg.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                    color: white),
                                // child: FittedBox(
                                //   child: Text(
                                //     _username,
                                //     textScaleFactor: 1,
                                //     style: (GoogleFonts.mulish(
                                //       fontSize: 19.sp,
                                //       fontWeight: FontWeight.bold,
                                //       color: white,
                                //     )),
                                //   ),
                                // ),
                              ),
                              // CircleAvatar(backgroundColor: white,
                              //   radius:
                              //       MediaQuery.of(context).size.height * 0.045.r,
                              //   backgroundImage:
                              //       AssetImage("assets/images/ILALOGO.png"),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  child: IconButton(
                                    onPressed: () =>
                                        //  Scaffold.of(context).openEndDrawer(),
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Mainhome())),
                                    icon: Icon(
                                      Icons.home,
                                      size: 30,
                                      color: Colors.white,
                                      semanticLabel: "Home",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.015.h,
                          ),
                          Container(
                            child: Text(
                              "Hi  $_username ",
                              textScaleFactor: 1,
                              style: (GoogleFonts.mulish(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.bold,
                                color: white,
                              )),
                            ),
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.005.h,
                          ),
                          Container(
                            child: Text(
                              "$_phone",
                              style: GoogleFonts.mulish(
                                fontSize: 17.sp,
                                // fontWeight: FontWeight.bold,
                                color: white,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01.h,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.person,
                              color: navy,
                            ),
                            title: Text(
                              translate!.drawerkey1,
                              style: hStyle,
                              textScaleFactor: 1,
                            ),
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile())),
                          ),
                          Divider(),
                          // ListTile(
                          //   leading: Icon(Icons.history, color: navy),
                          //   title: Text("History",textScaleFactor: 1, style: hStyle),
                          //   onTap: () => Navigator.pushReplacement(context,
                          //       MaterialPageRoute(builder: (context) => History())),
                          // ),
                          // Divider(),
                          ListTile(
                            leading:
                                Icon(Icons.subscriptions_sharp, color: navy),
                            title: Text(translate.drawerkey2,
                                textScaleFactor: 1, style: hStyle),
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Offers())),
                          ),
                          Divider(),
                          ListTile(
                            leading:
                                Icon(Icons.supervised_user_circle, color: navy),
                            title: Text(translate.drawerkey3,
                                textScaleFactor: 1, style: hStyle),
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OtherServicesform())),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.cases_rounded, color: navy),
                            title: Text(translate.drawerkey7,
                                textScaleFactor: 1, style: hStyle),
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Careers())),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.language_rounded, color: navy),
                            title: Text(translate.drawerkey4,
                                textScaleFactor: 1, style: hStyle),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text(
                                          translate.languagekey,
                                          style: hStyle,
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
                                                style: hStyle,
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
                                                style: hStyle,
                                              ))
                                        ],
                                      ));
                            },
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.contact_page, color: navy),
                            title: Text(translate.drawerkey5,
                                textScaleFactor: 1, style: hStyle),
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Contact())),
                          ),
                          Divider(),
                          ListTile(
                              leading: Icon(Icons.logout, color: navy),
                              title: Text(
                                translate.drawerkey6,
                                textScaleFactor: 1,
                                style: GoogleFonts.mulish(
                                    color: navy,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                _auth.signOut().then((value) =>
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Loginpage())));
                              }
                              //alert(),
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }

  Future<void> getdata() async {
    FirebaseFirestore.instance
        .collection("ILA")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      if (mounted)
        setState(() {
          _username = value.data()!["name"].toString();
          _phone = value.data()!["cellnumber"].toString();
        });
    });
  }
}
