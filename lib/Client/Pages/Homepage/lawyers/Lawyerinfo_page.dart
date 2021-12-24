import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../main.dart';


class LawyerInfopage extends StatefulWidget {
  LawyerInfopage(
      {required this.name,required this.images,
      required this.specialized,
      required this.description});
  final String name, specialized, description,images;
  
  @override
  _LawyerInfopageState createState() => _LawyerInfopageState();
}

class _LawyerInfopageState extends State<LawyerInfopage> {

  void onback(){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Mainhome()));
  }  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
              backgroundColor: gold,
              onPressed: () {
                launcher("tel: 04443511235");
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
                    decoration: BoxDecoration(color: white,
                        image: DecorationImage(
                            image:NetworkImage(widget.images),
                            fit: BoxFit.contain)),
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
                            widget.name,
                            style: GoogleFonts.mulish(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: navy),
                          ),
                          // Text("Experience ${toplawyerlist.Experience}",style: hStyle,),
                          Text("${widget.specialized} Lawyer",
                              style: GoogleFonts.mulish(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: navy)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03.h,
                          ),
                          Text(
                            widget.description,
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
