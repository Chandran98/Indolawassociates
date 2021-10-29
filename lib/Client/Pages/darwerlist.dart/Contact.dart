import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Homepage/drawer.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';
class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }

  onback() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Maindrawer()));
  }

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: IconButton(
                            iconSize: 40.r,
                            color: white,
                            icon: SvgPicture.asset(
                              "assets/icons/back.svg",
                              color: navy,
                            ),
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Maindrawer()))),
                      ),
                      // Container(
                      //   child: IconButton(
                      //     iconSize: 20,
                      //     color: white,
                      //     icon: SvgPicture.asset(
                      //       "assets/icons/3dots.svg",
                      //       color: navy,
                      //     ),
                      //     onPressed: () {},
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contact Us",
                        style: GoogleFonts.mulish(
                            fontSize: 24.sp,
                            color: navy,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        "Need help with your booking ?\nGet instant help from our customer support team",
                        style: hStyle,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03.h,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {
                                  launcher("tel: 7092053592");
                                },
                                child: Card(
                                  elevation: 4,
                                  child: Container(
                                    // decoration: BoxDecoration(
                                    //     gradient: LinearGradient(
                                    //         begin: Alignment.topCenter,
                                    //         end: Alignment.bottomCenter,
                                    //         colors: [
                                    //       Colors.white,
                                    //       Colors.white,
                                    //       Colors.white,
                                    //       Colors.lightBlue.shade100,
                                    //       Colors.lightBlue.shade300
                                    //     ])),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(top: 5),
                                          child: CircleAvatar(
                                            backgroundColor: white,
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.032.h,
                                            backgroundImage: AssetImage(
                                                "assets/images/call.png"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: FittedBox(
                                            child: Text(
                                              "Contact Us",
                                              style: hStyle,textScaleFactor: 1,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.13.h,
                                    width: MediaQuery.of(context).size.width *
                                        0.35.w,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                launcher("mailto: Chandranjc3@gmail.com");
                              },
                              child: Card(
                                elevation: 4,
                                child: Container(
                                  // decoration: BoxDecoration(
                                  //     gradient: LinearGradient(
                                  //         begin: Alignment.topCenter,
                                  //         end: Alignment.bottomCenter,
                                  //         colors: [
                                  //       Colors.white,
                                  //       Colors.white,
                                  //       Colors.white,
                                  //       Colors.lightBlue.shade100,
                                  //       Colors.lightBlue.shade300,
                                  //     ])),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: 10),
                                        child: CircleAvatar(
                                          backgroundColor: white,
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.029.h,
                                          backgroundImage: AssetImage(
                                              "assets/images/email.png"),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: FittedBox(
                                          child: Text(
                                            "Mail it",
                                            style: hStyle,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.13.h,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Send Feedback",
                        style: GoogleFonts.mulish(
                            fontSize: 20.sp,
                            color: navy,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.021,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.star,
                                  color: gold,
                                ),
                                labelStyle: hStyle,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1)))),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Container(
                        width: MediaQuery.of(context).size.width * .4.h,
                        height: MediaQuery.of(context).size.height * .06.w,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: gold,
                          elevation: 7.0,
                          child: TextButton(
                            onPressed: () {

                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted"),));},
                            child: Center(
                                child: Text('Submit',
                                    style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.bold,
                                        color: white,
                                        fontSize: 20.sp))),
                          ),
                        ),
                      ),
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
