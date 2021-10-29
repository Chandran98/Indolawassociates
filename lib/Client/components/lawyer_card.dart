import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../main.dart';
import 'Card_details.dart';

class Lawyercard extends StatelessWidget {
  const Lawyercard({Key? key, required this.toplawyerlist}) : super(key: key);
  final Toplawyerlist toplawyerlist;

  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => lawyerinfopage(context))),
      child: Card(
        color: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        ),
        elevation: 5,
        child: Container(
          width: MediaQuery.of(context).size.width * .1.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
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
                        width: MediaQuery.of(context).size.width * 0.05.w,
                        height: MediaQuery.of(context).size.height * 0.08.h,
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.white, width: 5),

                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(toplawyerlist.Image),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.grey.shade100,
                        ),
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
                        height: MediaQuery.of(context).size.height * 0.12.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              toplawyerlist.name,
                              style: GoogleFonts.mulish(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: navy),
                            ),
                            Text(
                              toplawyerlist.type,
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
  }

  lawyerinfopage(context) {
    void onback() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Mainhome()));
    }

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
        body:Container(child: SingleChildScrollView(
          child: Column(children: [  Padding(
            padding: const EdgeInsets.only(top:3.0),
            child: Container(
                  height: MediaQuery.of(context).size.height * 0.2.h,
                  width: MediaQuery.of(context).size.width * 1.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(toplawyerlist.Image),
                          fit: BoxFit.cover)),),
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
                            toplawyerlist.name,
                            style: GoogleFonts.mulish(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: navy),
                          ),
                          // Text("Experience ${toplawyerlist.Experience}",style: hStyle,),
                          Text(toplawyerlist.type,
                              style: GoogleFonts.mulish(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: navy)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03.h,
                          ),
                          Text(
                            "       At vero eos et accusamus et iusto odio dignissie corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.",
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
        ))
        
        
        
        
        
        
        //  SingleChildScrollView(
        //     child: Stack(
        //   children: [
        //     Container(
        //       height: MediaQuery.of(context).size.height * 0.2.h,
        //       width: MediaQuery.of(context).size.width * 1.w,
        //       decoration: BoxDecoration(
        //           image: DecorationImage(
        //               image: AssetImage("assets/images/intro_screen3.jpg"),
        //               fit: BoxFit.cover)),
        //       child: Container(
        //         height: MediaQuery.of(context).size.height * 0.15.h,
        //         width: MediaQuery.of(context).size.width * 0.3.w,
        //         decoration: BoxDecoration(
        //             shape: BoxShape.rectangle,
        //             border: Border.all(color: Colors.white, width: 5),
        //             image: DecorationImage(
        //                 image: AssetImage(toplawyerlist.Image),
        //                 fit: BoxFit.cover)),
        //         // child:   CircleAvatar(
        //         //       radius: MediaQuery.of(context).size.height * 0.05.r,
        //         //       backgroundImage:
        //         //           AssetImage(toplawyerlist.Image),
        //       ),
        //     ),
        //     // Padding(
        //     //   padding: const EdgeInsets.symmetric(vertical:500.0),
        //     //   child:
        //     // )
        //     Padding(
        //       padding: const EdgeInsets.only(
        //         top: 200.0,
        //       ),
        //       child: Container(
        //         height: MediaQuery.of(context).size.height * 0.58.h,
        //         color: white,
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Padding(
        //             padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
        //             child: Column(
        //               children: [
        //                 Text(
        //                   toplawyerlist.name,
        //                   style: GoogleFonts.mulish(
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 20.sp,
        //                       color: navy),
        //                 ),
        //                 // Text("Experience ${toplawyerlist.Experience}",style: hStyle,),
        //                 Text(toplawyerlist.type,
        //                     style: GoogleFonts.mulish(
        //                         fontWeight: FontWeight.w600,
        //                         fontSize: 16.sp,
        //                         color: navy)),
        //                 SizedBox(
        //                   height: MediaQuery.of(context).size.height * 0.03.h,
        //                 ),
        //                 Text(
        //                   "       At vero eos et accusamus et iusto odio dignissie corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.",
        //                   style: GoogleFonts.mulish(
        //                       fontWeight: FontWeight.w600,
        //                       fontSize: 15.sp,
        //                       color: navy),
        //                   textAlign: TextAlign.justify,
        //                   textScaleFactor: 1,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     // Padding(
        //     //   padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 40.h),
        //     //   child: Container(
        //     //     height: MediaQuery.of(context).size.height * 0.15.h,
        //     //     width: MediaQuery.of(context).size.width * 0.3.w,
        //     //     decoration: BoxDecoration(shape: BoxShape.rectangle,
        //     //         border: Border.all(color: Colors.white, width: 5),
        //     //         image: DecorationImage(
        //     //             image: AssetImage(toplawyerlist.Image),
        //     //             fit: BoxFit.cover)),
        //     // child:   CircleAvatar(
        //     //       radius: MediaQuery.of(context).size.height * 0.05.r,
        //     //       backgroundImage:
        //     //           AssetImage(toplawyerlist.Image),
        //     //               ),
        //     // ),
        //   ],
        // )),

        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     CustomPaint(
        //       child: Container(
        //         child: Center(
        //           child: Text(
        //             toplawyerlist.name,
        //             style: GoogleFonts.mulish(
        //               fontSize: 35,
        //               letterSpacing: 1.5,
        //               color: Colors.white,
        //               fontWeight: FontWeight.w600,
        //             ),
        //           ),
        //         ),
        //         width: MediaQuery.of(context).size.width,
        //         height: MediaQuery.of(context).size.height * 0.1,
        //       ),
        //       painter: HeaderCurvedContainer(),
        //     ),
        //     Container(
        //       width: MediaQuery.of(context).size.width * 0.4,
        //       height: MediaQuery.of(context).size.width * 0.35,
        //       decoration: BoxDecoration(
        //         border: Border.all(color: Colors.white, width: 5),
        //         shape: BoxShape.circle,
        //         color: navy,
        //         image: DecorationImage(
        //           fit: BoxFit.fitHeight,
        //           image: AssetImage(toplawyerlist.Image),
        //         ),
        //       ),
        //     ),SizedBox(height: MediaQuery.of(context).size.height*0.02,),
        //     Container(
        //       padding: EdgeInsets.all(10),
        //       height: MediaQuery.of(context).size.height * 0.6,
        //       margin: EdgeInsets.symmetric(horizontal: 10),
        //       child: Text(
        //         "       At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.",
        //         style: sStyle,
        //         textAlign: TextAlign.justify,
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}

// class HeaderCurvedContainer extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..color = navy;
//     Path path = Path()
//       ..relativeLineTo(0, 200)
//       ..quadraticBezierTo(size.width / 1.5, 150, size.width, 120)
//       ..relativeLineTo(0, -200)
//       ..close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
