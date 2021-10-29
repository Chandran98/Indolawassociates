// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:indo_law/Client/Pages/Homepage/drawer.dart';
// import 'package:indo_law/Client/constants/constant.dart';


// class History extends StatefulWidget {
//   const History({Key? key}) : super(key: key);

//   @override
//   _HistoryState createState() => _HistoryState();
// }

// class _HistoryState extends State<History> { void onback() {
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => Maindrawer()));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () {
//         onback();
//         return Future.value(false);
//       },
//       child: SafeArea(
//           child: Scaffold(
//         appBar: AppBar(
//           toolbarHeight: 60,
//           backgroundColor: navy,
//           title: Text(
//             "History",
//             style: GoogleFonts.mulish(color: Colors.white, fontSize: 20),
//           ),
//           leading: IconButton(
//               onPressed: () => Navigator.pushReplacement(
//                   context, MaterialPageRoute(builder: (context) => Maindrawer())),
//               icon: Icon(Icons.arrow_back)),
//         ),        body: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Padding(
//                         padding: EdgeInsets.only(top: 20, left: 10, right: 50)),
//                     Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(30),
//                             bottomRight: Radius.circular(30)),
//                       ),
//                       elevation: 5,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(30),
//                               bottomRight: Radius.circular(30)),
//                           color: Colors.grey.shade100,
//                         ),
//                         child: Stack(
//                           clipBehavior: Clip.none,
//                           alignment: Alignment.topRight,
//                           children: [
//                             Row(
//                               children: [
//                                 Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width *
//                                           0.05,
//                                       height:
//                                           MediaQuery.of(context).size.height *
//                                               0.1,
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         image: DecorationImage(
//                                           image: AssetImage(
//                                               "assets/images/Lawyer2.jpg"),
//                                           fit: BoxFit.cover,
//                                         ),
//                                         color: Colors.grey.shade100,
//                                       ),
//                                     )),
//                                 Expanded(
//                                     flex: 2,
//                                     child: Container(
//                                       padding: EdgeInsets.all(10),
//                                       decoration: BoxDecoration(
//                                         color: Colors.grey.shade100,
//                                         borderRadius: BorderRadius.only(
//                                             bottomRight: Radius.circular(30)),
//                                       ),
//                                       width:
//                                           MediaQuery.of(context).size.width / 8,
//                                       height:
//                                           MediaQuery.of(context).size.height *
//                                               0.15,
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "Stan",
//                                             style: GoogleFonts.varelaRound(
//                                                 fontSize: 20, color: navy),
//                                           ),
//                                           Text(
//                                             "Divorce",
//                                             style: GoogleFonts.varelaRound(
//                                                 fontSize: 15, color: navy),
//                                           ),
//                                           Text(
//                                             "Exp: 2yr",
//                                             style: GoogleFonts.varelaRound(
//                                                 fontSize: 15, color: navy),
//                                           ),
//                                         ],
//                                       ),
//                                     )),
//                                 Expanded(
//                                   flex: 2,
//                                   child: Container(
//                                     width:
//                                         MediaQuery.of(context).size.width * 0.5,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(12),
//                                       color: Colors.green,
//                                     ),
//                                     child: Center(
//                                       child: Text("Accepted",
//                                           style: (GoogleFonts.frankRuhlLibre(
//                                               fontSize: 25,
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold))),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(30),
//                             bottomRight: Radius.circular(30)),
//                       ),
//                       elevation: 5,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(30),
//                               bottomRight: Radius.circular(30)),
//                           color: Colors.grey.shade100,
//                         ),
//                         child: Stack(
//                           clipBehavior: Clip.none,
//                           alignment: Alignment.topRight,
//                           children: [
//                             Row(
//                               children: [
//                                 Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width *
//                                           0.05,
//                                       height:
//                                           MediaQuery.of(context).size.height *
//                                               0.1,
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         image: DecorationImage(
//                                           image: AssetImage(
//                                               "assets/images/Lawyer5.jfif"),
//                                           fit: BoxFit.cover,
//                                         ),
//                                         color: Colors.grey.shade100,
//                                       ),
//                                     )),
//                                 Expanded(
//                                     flex: 2,
//                                     child: Container(
//                                       padding: EdgeInsets.all(10),
//                                       decoration: BoxDecoration(
//                                         color: Colors.grey.shade100,
//                                         borderRadius: BorderRadius.only(
//                                             bottomRight: Radius.circular(30)),
//                                       ),
//                                       width:
//                                           MediaQuery.of(context).size.width / 8,
//                                       height:
//                                           MediaQuery.of(context).size.height *
//                                               0.15,
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "Thomas",
//                                             style: GoogleFonts.varelaRound(
//                                                 fontSize: 20, color: navy),
//                                           ),
//                                           Text(
//                                             "Taxation",
//                                             style: GoogleFonts.varelaRound(
//                                                 fontSize: 15, color: navy),
//                                           ),
//                                           Text(
//                                             "Exp: 5yr",
//                                             style: GoogleFonts.varelaRound(
//                                                 fontSize: 15, color: navy),
//                                           ),
//                                         ],
//                                       ),
//                                     )),
//                                 Expanded(
//                                   flex: 2,
//                                   child: Container(
//                                     width:
//                                         MediaQuery.of(context).size.width * 0.5,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(12),
//                                       color: Colors.red,
//                                     ),
//                                     child: Center(
//                                       child: Text("Denied",
//                                           style: (GoogleFonts.frankRuhlLibre(
//                                               fontSize: 25,
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold))),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )),
    
//       ),
//     );
//   }
// }
