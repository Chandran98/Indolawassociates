import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Homepage/lawyers/services/lawyer_services.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/widgets/Lawyers/Lawyer_info_page.dart';

class Relawyerlist extends StatefulWidget {
  Relawyerlist({Key? key}) : super(key: key);

  @override
  _RelawyerlistState createState() => _RelawyerlistState();
}

class _RelawyerlistState extends State<Relawyerlist> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  LawyerDB lawyerDB = LawyerDB();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder<QuerySnapshot>(
      stream: lawyerDB.getlawyerdb(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...snapshot.data!.docs
                    .map((QueryDocumentSnapshot<Object?> doc) {
                  final String name = doc.get("name");
                  final String specialized = doc.get("specialized");
                  final String description = doc.get("description");
                  final String images = doc.get("images");

                  return InkWell(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Lawyerinfocard(
                                  name: name,
                                  specialized: specialized,
                                  description: description,
                                  images: images,
                                ))),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          height: height * 0.22.h,
                          width: width * 0.45.w,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5.w,
                                  height: MediaQuery.of(context).size.height *
                                      0.1.h,
                                  decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.white, width: 5),

                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(images),
                                      fit: BoxFit.contain,
                                    ),
                                    color: Colors.grey.shade100,
                                  ),
                                ),
                              ),
                              Text(
                                name.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: black),
                              ),
                              Text(
                                "${specialized.toString()} Lawyer",
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: black),
                              )
                            ],
                          ),
                        )),

                    //  Card(
                    //   color: Colors.amber,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(30),
                    //         bottomRight: Radius.circular(30)),
                    //   ),
                    //   elevation: 5,
                    //   child: Container(
                    //     width: MediaQuery.of(context).size.width * .1.w,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.only(
                    //           topLeft: Radius.circular(30),
                    //           bottomRight: Radius.circular(30)),
                    //       color: Colors.grey.shade100,
                    //     ),
                    //     child: Stack(
                    //       clipBehavior: Clip.none,
                    //       alignment: Alignment.topRight,
                    //       children: [
                    //         Row(
                    //           children: [
                    //             Expanded(
                    //                 flex: 2,
                    //                 child: Container(
                    //                   margin: EdgeInsets.all(2),
                    //                   width: MediaQuery.of(context).size.width *
                    //                       0.05.w,
                    //                   height: MediaQuery.of(context).size.height *
                    //                       0.08.h,
                    //                   decoration: BoxDecoration(
                    //                     // border: Border.all(color: Colors.white, width: 5),

                    //                     shape: BoxShape.circle,
                    //                     image: DecorationImage(

                    //                       image: NetworkImage(images),
                    //                       fit: BoxFit.contain,
                    //                     ),
                    //                     color: Colors.grey.shade100,
                    //                   ),
                    //                 )),
                    //             Expanded(
                    //                 flex: 4,
                    //                 child: Container(
                    //                   padding: EdgeInsets.all(10),
                    //                   decoration: BoxDecoration(
                    //                     color: Colors.grey.shade100,
                    //                     borderRadius: BorderRadius.only(
                    //                         bottomRight: Radius.circular(30)),
                    //                   ),
                    //                   height: MediaQuery.of(context).size.height *
                    //                       0.12.h,
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     children: [
                    //                       Text(
                    //                         name.toString(),
                    //                         style: GoogleFonts.mulish(
                    //                             fontSize: 20.sp,
                    //                             fontWeight: FontWeight.w500,
                    //                             color: navy),
                    //                       ),
                    //                       Text(
                    //                         "${specialized.toString()} Lawyer",
                    //                         style: GoogleFonts.varelaRound(
                    //                             fontSize: 14.sp, color: navy),
                    //                       ),
                    //                       // Text(
                    //                       //   toplawyerlist.Experience,
                    //                       //   style: GoogleFonts.varelaRound(
                    //                       //       fontSize: 15, color: navy),
                    //                       // ),
                    //                     ],
                    //                   ),
                    //                 )),
                    //           ],
                    //         ),
                    //         // Positioned(
                    //         //   right: 20,
                    //         //   top: 10,
                    //         //   // ignore: deprecated_member_use
                    //         //   child: RaisedButton.icon(
                    //         //     color: navy,
                    //         //     shape: RoundedRectangleBorder(
                    //         //         borderRadius: BorderRadius.circular(12)),
                    //         //     onPressed: () => Navigator.pushReplacement(
                    //         //         context,
                    //         //         MaterialPageRoute(
                    //         //             builder: (context) => lawyerinfopage(context))),
                    //         //     label: Text("View", style: TextStyle(color: Colors.white)),
                    //         //     icon: Icon(
                    //         //       Icons.remove_red_eye,
                    //         //       color: Colors.white,
                    //         //     ),
                    //         //   ),
                    //         // ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  );
                })
              ],
            ),
          );
        }
      },
    );
  }
}
