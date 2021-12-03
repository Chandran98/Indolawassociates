import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Homepage/drawer.dart';
import 'package:indolawassociates/Client/components/lawyers/services/lawyer_services.dart';
import 'package:indolawassociates/Client/constants/constant.dart';

import 'dummy3.dart';

class Lawyerlist extends StatefulWidget {
  const Lawyerlist({Key? key}) : super(key: key);

  @override
  State<Lawyerlist> createState() => _LawyerlistState();
}

class _LawyerlistState extends State<Lawyerlist> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  LawyerDB lawyerDB = LawyerDB();
  // String ? name;
  // String ? specialized;
  // String ? description;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: lawyerDB.getlawyerdb(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else {
          return ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              ...snapshot.data!.docs.map((QueryDocumentSnapshot<Object?> doc) {
                final String name = doc.get("name");
                final String specialized = doc.get("specialized");
                final String description = doc.get("description");
                return InkWell(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LAwyerpagw(
                                name:name,
                                specialized: specialized,
                                description: description,
                              ))),
                  child: Card(
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .1.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        color: Colors.grey.shade100,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topRight,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    width: MediaQuery.of(context).size.width *
                                        0.05.w,
                                    height: MediaQuery.of(context).size.height *
                                        0.08.h,
                                    // decoration: BoxDecoration(
                                    //   // border: Border.all(color: Colors.white, width: 5),

                                    //   shape: BoxShape.circle,
                                    //   image: DecorationImage(
                                    //     image: AssetImage(toplawyerlist.Image),
                                    //     fit: BoxFit.contain,
                                    //   ),
                                    //   color: Colors.grey.shade100,
                                    // ),
                                  )),
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(30)),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.12.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          name.toString(),
                                          style: GoogleFonts.mulish(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500,
                                              color: navy),
                                        ),
                                        Text(
                                          specialized.toString(),
                                          style: GoogleFonts.varelaRound(
                                              fontSize: 14.sp, color: navy),
                                        ),
                                        // Text(
                                        //   toplawyerlist.Experience,
                                        //   style: GoogleFonts.varelaRound(
                                        //       fontSize: 15, color: navy),
                                        // ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                          // Positioned(
                          //   right: 20,
                          //   top: 10,
                          //   // ignore: deprecated_member_use
                          //   child: RaisedButton.icon(
                          //     color: navy,
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(12)),
                          //     onPressed: () => Navigator.pushReplacement(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => lawyerinfopage(context))),
                          //     label: Text("View", style: TextStyle(color: Colors.white)),
                          //     icon: Icon(
                          //       Icons.remove_red_eye,
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          );
        }
      },
    );
  }
}
