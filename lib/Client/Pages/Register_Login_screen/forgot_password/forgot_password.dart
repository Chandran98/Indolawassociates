// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:indolawassociates/Client/Pages/Register_Login_screen/Login.dart/Login.dart';
// import 'package:indolawassociates/Client/constants/constant.dart';
// import 'new_password.dart';

// class Forgot extends StatefulWidget {
//   const Forgot({Key? key}) : super(key: key);

//   @override
//   _ForgotState createState() => _ForgotState();
// }

// class _ForgotState extends State<Forgot> {onback() {
//       Navigator.of(context).pop();
//     }
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(   onWillPop: () {
//         onback();
//         return Future.value(false);
//       },
//       child: SafeArea(
//         child: Scaffold(
//           body: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 28.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Container(
//                       child: IconButton(
//                           iconSize: 40,
//                           color: white,
//                           icon: SvgPicture.asset(
//                             "assets/icons/back.svg",
//                             color: navy,
//                           ),
//                           onPressed: () => Navigator.pushReplacement(context,
//                               MaterialPageRoute(builder: (context) => LoginPage()))),
//                     ),
//                     // Container(
//                     //   child: IconButton(
//                     //     iconSize: 20,
//                     //     color: white,
//                     //     icon: SvgPicture.asset(
//                     //       "assets/icons/3dots.svg",
//                     //       color: navy,
//                     //     ),
//                     //     onPressed: () {},
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.016,
//               ),
//               Container(
//                 padding: EdgeInsets.only(left: 20, top: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Reset password",
//                       style: GoogleFonts.mulish(
//                           fontSize: 30, color: navy, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.01,
//                     ),
//                     Text(
//                       "Enter the email associated with your account and we'll send an email with instructions to reset your password",
//                       style: hStyle,
//                       textAlign: TextAlign.left,
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.051,
//                     ),
//                     Text(
//                       "Email address",
//                       style: GoogleFonts.mulish(
//                           fontSize: 20, color: navy, fontWeight: FontWeight.bold),
//                       textAlign: TextAlign.left,
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.021,
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.85,
//                       child: TextFormField(
//                           obscureText: true,
//                           decoration: InputDecoration(
//                               prefixIcon: Icon(
//                                 Icons.mail,
//                                 color: navy,
//                               ),
//                               hintText: "eg. lead235@gmail.com",
//                               labelStyle: hStyle,
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.black, width: 1)))),
//                     ),
//                     SizedBox(height: MediaQuery.of(context).size.height * 0.05),
//                     Container(
//                       width: MediaQuery.of(context).size.width * .6,
//                       height: MediaQuery.of(context).size.height * .06,
//                       child: Material(
//                         borderRadius: BorderRadius.circular(20.0),
//                         color: gold,
//                         elevation: 7.0,
//                         child: TextButton(
//                           onPressed: () => Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Newpassword())),
//                           child: Center(
//                               child: Text('Submit',
//                                   style: GoogleFonts.mulish(
//                                       fontWeight: FontWeight.bold,
//                                       color: white,
//                                       fontSize: 20))),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
         
//         ),
//       ),
//     );
//   }
// }
