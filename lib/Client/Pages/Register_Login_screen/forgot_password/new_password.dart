// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:indolawassociates/Client/constants/constant.dart';

// import 'forgot_password.dart';

// class Newpassword extends StatefulWidget {
//   const Newpassword({Key? key}) : super(key: key);

//   @override
//   _NewpasswordState createState() => _NewpasswordState();
// }

// class _NewpasswordState extends State<Newpassword> {onback() {
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
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 28.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Container(
//                         child: IconButton(
//                             iconSize: 40,
//                             color: white,
//                             icon: SvgPicture.asset(
//                               "assets/icons/back.svg",
//                               color: navy,
//                             ),
//                             onPressed: () => Navigator.pushReplacement(context,
//                                 MaterialPageRoute(builder: (context) => Forgot()))),
//                       ),
//                       // Container(
//                       //   child: IconButton(
//                       //     iconSize: 20,
//                       //     color: white,
//                       //     icon: SvgPicture.asset(
//                       //       "assets/icons/3dots.svg",
//                       //       color: navy,
//                       //     ),
//                       //     onPressed: () {},
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.016,
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(left: 10, top: 30),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Create new password",
//                         textAlign: TextAlign.left,
//                         style: GoogleFonts.mulish(
//                             fontSize: 30, color: navy, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.01,
//                       ),
//                       Text(
//                         "Your new password must be different from previous used passwords.",
//                         style: hStyle,
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.051,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Password",
//                             style: GoogleFonts.mulish(
//                                 fontSize: 20,
//                                 color: navy,
//                                 fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.left,
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.021,
//                           ),
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.85,
//                             child: TextFormField(
//                                 obscureText: true,
//                                 validator: MultiValidator([
//                                   RequiredValidator(errorText: passwordnull),
//                                   MinLengthValidator(6, errorText: passwordshort)
//                                 ]),
//                                 decoration: InputDecoration(
//                                     prefixIcon: Icon(
//                                       Icons.vpn_lock,
//                                       color: navy,
//                                     ),
//                                     hintText: "**********",
//                                     labelStyle: hStyle,
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Colors.black, width: 1)))),
//                           ),
//                           SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.01),
//                           Text(
//                             "Confirm Password",
//                             style: GoogleFonts.mulish(
//                                 fontSize: 20,
//                                 color: navy,
//                                 fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.left,
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.01,
//                           ),
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.85,
//                             child: TextFormField(
//                                 obscureText: true,
//                                 decoration: InputDecoration(
//                                     prefixIcon: Icon(
//                                       Icons.vpn_lock,
//                                       color: navy,
//                                     ),
//                                     hintText: "**********",
//                                     labelStyle: hStyle,
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Colors.black, width: 1)))),
//                           ),
//                           SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.051),
//                           Container(
//                             width: MediaQuery.of(context).size.width * .6,
//                             height: MediaQuery.of(context).size.height * .06,
//                             child: Material(
//                               borderRadius: BorderRadius.circular(20.0),
//                               color: gold,
//                               elevation: 7.0,
//                               child: TextButton(
//                                 onPressed: () {},
//                                 child: Center(
//                                     child: Text('Reset  Password',
//                                         style: GoogleFonts.mulish(
//                                             fontWeight: FontWeight.bold,
//                                             color: white,
//                                             fontSize: 20))),
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
