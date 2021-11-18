import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/darwerlist.dart/Contact.dart';
import 'package:indolawassociates/Client/Pages/darwerlist.dart/Offers.dart';
import 'package:indolawassociates/Client/Pages/darwerlist.dart/Otherservices.dart';
import 'package:indolawassociates/Client/Pages/darwerlist.dart/profile.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/Pages/Register_Login_screen/Login.dart/log.dart';

import '../../../main.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var username = '';

class Maindrawer extends StatefulWidget {
  @override
  _MaindrawerState createState() => _MaindrawerState();
}

class _MaindrawerState extends State<Maindrawer> {
  alert() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              contentPadding: EdgeInsets.all(18),
              elevation: 10,
              title: Text(
                "Do you want to Logout?",
                style: bStyle,
                textScaleFactor: 1,
              ),
              actions: [
                // ignore: deprecated_member_use
                FlatButton(
                    onPressed: () {
                      _auth.signOut().then((value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Loginpage())));
                    },
                    child: Text(
                      "Yes",
                      style: hStyle,
                      textScaleFactor: 1,
                    )),
                // ignore: deprecated_member_use
                FlatButton(
                    onPressed: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Maindrawer())),
                    child: Text(
                      "No",
                      style: hStyle,
                      textScaleFactor: 1,
                    ))
              ],
            ));
  }

  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Mainhome()));
  }

  @override
  void initState() {
    getuser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                              width: MediaQuery.of(context).size.width * 0.25.w,
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
                              //     "Richard Lee",
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
                                  onPressed: () => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (context) => Mainhome())),
                                  icon: Icon(
                                    Icons.home,
                                    size: 30.r,
                                    color: Colors.white,
                                    semanticLabel: "Home",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01.h,
                        ),
                        // Container(
                        //   child: FittedBox(
                        //     child: Text(
                        //       "Hi" + username,
                        //       textScaleFactor: 1,
                        //       style: (GoogleFonts.mulish(
                        //         fontSize: 19.sp,
                        //         fontWeight: FontWeight.bold,
                        //         color: white,
                        //       )),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.01.h,
                        // ),
                        // Container(
                        //   child: FittedBox(
                        //     child: Text(
                        //         //  '(cellnumber: ' +(_auth.currentUser!.phoneNumber != null? _auth.currentUser!.phoneNumber: '') +
                        //         ' uid:' +
                        //             (_auth.currentUser!.uid != null
                        //                 ? _auth.currentUser!.uid
                        //                 : '') +
                        //             ')'),
                        //   ),
                        // ),
                      ],
                    )),
                SingleChildScrollView(
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
                          "My Profile",
                          style: hStyle,
                          textScaleFactor: 1,
                        ),
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage())),
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
                        leading: Icon(Icons.subscriptions_sharp, color: navy),
                        title: Text("Offers & Subscriptions ",
                            textScaleFactor: 1, style: hStyle),
                        onTap: () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Offers())),
                      ),
                      Divider(),
                      ListTile(
                        leading:
                            Icon(Icons.supervised_user_circle, color: navy),
                        title: Text("ILA Services",
                            textScaleFactor: 1, style: hStyle),
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtherServicesform())),
                      ),
                      Divider(),
                      // ListTile(
                      //   leading: Icon(Icons.cases_rounded, color: navy),
                      //   title:
                      //       Text("Careers", textScaleFactor: 1, style: hStyle),
                      //   onTap: () => Navigator.pushReplacement(context,
                      //       MaterialPageRoute(builder: (context) => Careers())),
                      // ),
                      // Divider(),
                      ListTile(
                        leading: Icon(Icons.contact_page, color: navy),
                        title: Text("Contact Us",
                            textScaleFactor: 1, style: hStyle),
                        onTap: () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Contact())),
                      ),
                      Divider(),
                      ListTile(
                          leading: Icon(Icons.logout, color: navy),
                          title: Text(
                            "Log out",
                            textScaleFactor: 1,
                            style: GoogleFonts.mulish(
                                color: navy,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () => alert()
                          //alert(),
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getuser() async {
    if (_auth.currentUser != null) {
      var cellNumber = _auth.currentUser!.phoneNumber;
      cellNumber = '0' +
          _auth.currentUser!.phoneNumber!.substring(3, cellNumber!.length);
      debugPrint(cellNumber);
      await _firestore
          .collection("ILA")
          .where("cellnumber", isEqualTo: cellNumber)
          .get()
          .then((result) {
        if (result.docs.length > 0) {
          if (mounted)
            setState(() {
              username = result.docs[0].data()['name'];
            });
        }
      });
    }
  }
}
