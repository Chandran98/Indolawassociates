import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';

import '../../../main.dart';

class LAwyerpagw extends StatefulWidget {
  LAwyerpagw(
      {required this.name,
      required this.specialized,
      required this.description});
  final String name, specialized, description;
  @override
  _LAwyerpagwState createState() => _LAwyerpagwState();
}

class _LAwyerpagwState extends State<LAwyerpagw> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // onback();
        return Future.value(false);
      },
      child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
              backgroundColor: gold,
              onPressed: () {
                // launcher("tel: 04443511235");
              },
              icon: Icon(Icons.call),
              label: Text(
                "Book Appointment",
              )),
          appBar: AppBar(
            title: Text(
              "Lawyer Info",
              style: GoogleFonts.mulish(
                  color: navy, fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            elevation: 0.0,
            backgroundColor: white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: navy,
              ),
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Mainhome())),
            ),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2.h,
                    width: MediaQuery.of(context).size.width * 1.w,
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage(toplawyerlist.Image),
                    //         fit: BoxFit.contain)),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.56.h,
                  color: white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: Column(
                        children: [
                          Text(
                            widget.name.toString(),
                            style: GoogleFonts.mulish(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: navy),
                          ),
                          // Text("Experience ${toplawyerlist.Experience}",style: hStyle,),
                          Text(widget.specialized.toString(),
                              style: GoogleFonts.mulish(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: navy)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03.h,
                          ),
                          Text(
                            widget.description.toString(),
                            style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                color: navy),
                            textAlign: TextAlign.justify,
                            textScaleFactor: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
