import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/widgets/Lawyers/Lawyer_info_page.dart';
import 'package:indolawassociates/UI/widgets/Lawyers/lawyer_services.dart';

class Toplawyers extends StatefulWidget {
  Toplawyers({Key? key}) : super(key: key);

  @override
  _ToplawyersState createState() => _ToplawyersState();
}

class _ToplawyersState extends State<Toplawyers> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  LawyerDB lawyerDB = LawyerDB();

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return StreamBuilder<QuerySnapshot>(
      stream: lawyerDB.getlawyerdb(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            color: green,
          ));
        } else {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ...snapshot.data!.docs
                    .map((QueryDocumentSnapshot<Object?> doc) {
                  final String name = doc.get("name");
                  final String specialized = doc.get("specialized");
                  final String description = doc.get("description");
                  final String images = doc.get("images");
                  final String area1 = doc.get("area1");
                  final String area2 = doc.get("area2");
                  final String area3 = doc.get("area3");
                  final String area4 = doc.get("area4");
                  final String area5 = doc.get("area5");
                  final String area6 = doc.get("area6");

                  return InkWell(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LawyerinfoPage(
                                  area1: area1,
                                  area2: area2,
                                  area3: area3,
                                  area4: area4,
                                  area5: area5,
                                  area6: area6,
                                  name: name,
                                  specialized: specialized,
                                  description: description,
                                  images: images,
                                ))),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                        child: Container(
                            decoration: BoxDecoration(
                                // gradient: LinearGradient(
                                //     begin: Alignment.bottomLeft,
                                //     stops: [
                                //       0.2,
                                //       0.5
                                //     ],
                                //     colors: [
                                //       // Color(0xff6147cb),
                                //       // Color(0xffB94D9C)
                                //       //  appcolor.withOpacity(0.9),
                                //       green.withOpacity(.8),

                                //       green.withOpacity(.8),
                                //     ]),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30))
                                // BorderRadius.all(Radius.circular(20)),
                                ),
                            height: 120,
                            // width: width * 0.3.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // color: dialog,s
                                      border:
                                          Border.all(color: white, width: 2),
                                      shape: BoxShape.circle,
                                      // borderRadius: BorderRadius.all(Radius.circular(14)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: dialog.withOpacity(0.1),
                                            blurRadius: 10,
                                            offset: Offset(0, 5)),
                                      ],
                                    ),
                                    child: Container(
                                      height: 120,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(images),
                                            fit: BoxFit.contain,
                                          ),
                                          // color: white
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          name.toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              // color: white
                                              ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        AutoSizeText(
                                          "${specialized.toString()} Lawyer",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              // color: white
                                              ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ))),

                    // child: Card(
                    //     // color: dialog,
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20)),
                    //     elevation: 4,
                    //     child: Container(
                    //         // decoration: BoxDecoration(
                    //         //     // gradient: LinearGradient(
                    //         //     //     begin: Alignment.bottomLeft,
                    //         //     //     stops: [
                    //         //     //       0.2,
                    //         //     //       0.6
                    //         //     //     ],
                    //         //     //     colors: [
                    //         //     //       green.withOpacity(.8),
                    //         //     //       Colors.purple.shade700.withOpacity(0.9)
                    //         //     //     ]),
                    //         //     borderRadius: BorderRadius.circular(20)
                    //         //     // BorderRadius.all(Radius.circular(20)),
                    //         //     ),
                    //         height: 210,
                    //         width: 160,
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //           children: [
                    //             Stack(
                    //               children: [
                    //                 Container(
                    //                   height: 140,
                    //                   width: 200,
                    //                   decoration: BoxDecoration(
                    //                       borderRadius: BorderRadius.only(
                    //                           topLeft: Radius.circular(20),
                    //                           topRight: Radius.circular(20))),
                    //                   child: Image.network(images,
                    //                       fit: BoxFit.fitWidth),
                    //                   // decoration: BoxDecoration(
                    //                   //   shape: BoxShape.circle,
                    //                   //   image: DecorationImage(
                    //                   //     image: NetworkImage(images),
                    //                   //     fit: BoxFit.contain,
                    //                   //   ),
                    //                   // ),

                    //                 ),Container(height: 70,width: 70,color: Colors.red,)
                    //               ],
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.symmetric(
                    //                   horizontal: 20.0, vertical: 8),
                    //               child: Container(
                    //                 child: Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   // mainAxisAlignment: MainAxisAlignment.s,
                    //                   children: [
                    //                     AutoSizeText(
                    //                       name.toString(),
                    //                       style: GoogleFonts.poppins(
                    //                         fontSize: 12,
                    //                         fontWeight: FontWeight.w500,
                    //                       ),
                    //                     ),
                    //                     AutoSizeText(
                    //                       "${specialized.toString()} Lawyer",
                    //                       style: GoogleFonts.poppins(
                    //                         fontSize: 12,
                    //                         fontWeight: FontWeight.w500,
                    //                       ),
                    //                     )
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ))),

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
