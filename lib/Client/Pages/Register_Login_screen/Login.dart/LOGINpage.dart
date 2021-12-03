// import 'package:double_back_to_close_app/double_back_to_close_app.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:indolawassociates/Client/Pages/Register_Login_screen/Sign_Up/Sign_Up.dart';
// import 'package:indolawassociates/Client/constants/constant.dart';
// import 'package:indolawassociates/Client/Pages/Register_Login_screen/Login.dart/log.dart';
// import 'package:indolawassociates/main.dart';

// enum MobileVerificationState {
//   SHOW_MOBILE_FORM_STATE,
//   SHOW_OTP_FORM_STATE,
// }

// class LPage extends StatefulWidget {
//   LPage({Key? key}) : super(key: key);

//   @override
//   _LPageState createState() => _LPageState();
// }

// class _LPageState extends State<LPage> {
//   GlobalKey<FormState> loginpagekey = GlobalKey<FormState>();
//   GlobalKey<FormState> otppagekey = GlobalKey<FormState>();

//   MobileVerificationState currentState =
//       MobileVerificationState.SHOW_MOBILE_FORM_STATE;
//   final phoneController = TextEditingController();
//   final otpController = TextEditingController();
//   bool showLoading = false;
//   var verificationID;

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         key: _scaffoldKey,
//         // appBar: AppBar(
//         //   backgroundColor: navy,
//         //   title: Text(
//         //     "Payment",
//         //     style: GoogleFonts.mulish(
//         //         color: white, fontWeight: FontWeight.w500, fontSize: 20),
//         //   ),
//         //   leading: IconButton(
//         //       onPressed: () => Navigator.pushReplacement(
//         //           context, MaterialPageRoute(builder: (context) => Mainhome())),
//         //       icon: Icon(
//         //         Icons.arrow_back,
//         //         color: white,
//         //       )),
//         // ),
//         body: DoubleBackToCloseApp(
//           snackBar: const SnackBar(
//             backgroundColor: navy,
//             content: Text(
//               'Tap back again to exit app.',
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//           child: Stack(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.27.h,
//                 width: MediaQuery.of(context).size.width * 1.w,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage("assets/images/Login_image.jpg"),
//                         fit: BoxFit.cover)),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 200.h),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: white,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(22),
//                           topRight: Radius.circular(22))),
//                   height: MediaQuery.of(context).size.height * .7.h,
//                   width: MediaQuery.of(context).size.width * 1.w,
//                   child: Container(
//                     child: showLoading
//                         ? Center(
//                             child: CircularProgressIndicator(),
//                           )
//                         : currentState ==
//                                 MobileVerificationState.SHOW_MOBILE_FORM_STATE
//                             ? getMobileFormWidget(context)
//                             : getOtpFormWidget(context),
//                     padding: const EdgeInsets.all(16),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   getMobileFormWidget(context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 30.0, left: 5),
//       child: SingleChildScrollView(
//         child: Form(
//           key: loginpagekey,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.01.h,
//               ),
//               Text(
//                 "Welcome Back!",
//                 style: GoogleFonts.mulish(
//                     fontSize: 20.sp, fontWeight: FontWeight.w700, color: navy),
//                 textAlign: TextAlign.left,
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.01,
//               ),
//               Text(
//                 "Enter your mobile no. ",
//                 style: hStyle,
//                 textAlign: TextAlign.left,
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.05,
//               ),

//               // SizedBox(height: MediaQuery.of(context).size.height * 0.05),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   validator: MultiValidator([
//                     RequiredValidator(errorText: phonenull),
//                     MaxLengthValidator(13, errorText: loginphonenum),
//                     MinLengthValidator(13, errorText: loginphonenum)
//                   ]),
//                   controller: phoneController,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: "Enter Your mobile no. with +91",
//                       labelText: "Mobile no.",
//                       labelStyle: hStyle),
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.05.h),
//               TextButton(onPressed: (){Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Mainhome()));}, child: Text("data")),
//               Container(
//                 width: MediaQuery.of(context).size.width * .6.w,
//                 height: MediaQuery.of(context).size.height * .06.h,
//                 child: Material(
//                   borderRadius: BorderRadius.circular(20.0),
//                   color: gold,                                                        
//                   elevation: 7.0,
//                   child: TextButton(
//                     onPressed: () async {
//                       if (loginpagekey.currentState!.validate()) {
//                         setState(() {
//                           showLoading = true;
//                         });

//                         await _auth.verifyPhoneNumber(
//                             phoneNumber: phoneController.text,
//                             verificationCompleted: (phoneauthcredit) async {
//                               setState(() {
//                                 showLoading = false;
//                               });
//                             },
//                             verificationFailed: (verificationFailed) {
//                               setState(() {
//                                 showLoading = false;
//                               });
//                               // ignore: deprecated_member_use
//                               _scaffoldKey.currentState!.showSnackBar(SnackBar(
//                                   content: Text(
//                                       verificationFailed.message.toString())));
//                             },
//                             codeSent: (verificationID, resendtoken) async {
//                               setState(() {
//                                 showLoading = false;
//                                 currentState =
//                                     MobileVerificationState.SHOW_OTP_FORM_STATE;

//                                 this.verificationID = verificationID;
//                               });
//                             },
//                             codeAutoRetrievalTimeout: (verificationID) {});
//                       }
//                     },
//                     child: Center(
//                         child: Text('Submit',
//                             style: GoogleFonts.mulish(
//                                 fontWeight: FontWeight.bold,
//                                  color: white,
//                                 fontSize: 20.sp))),
//                   ),
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.05.h),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   children: <Widget>[
//               //     Container(
//               //       child: Text("Don't have a account ?",
//               //           style:
//               //               GoogleFonts.mulish(fontSize: 15.sp, color: navy)),
//               //     ),
//               //     InkWell(
//               //       onTap: () => Navigator.pushReplacement(context,
//               //           MaterialPageRoute(builder: (context) => Sigin())),
//               //       child: Text(
//               //         "Sign Up",
//               //         style: GoogleFonts.mulish(
//               //             fontSize: 15.sp,
//               //             color: navy,
//               //             fontWeight: FontWeight.bold,
//               //             decorationThickness: 2,
//               //             decorationColor: navy),
//               //       ),
//               //     )
//               //   ],
//               // ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.02.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   getOtpFormWidget(context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.only(top: 20.0, left: 5),
//         child: Form(
//           key: otppagekey,
//           child: Column(
//             children: [
//               Row(
//                 children: <Widget>[
//                   Container(
//                     child: IconButton(
//                         iconSize: 40.sp,
//                         color: white,
//                         icon: SvgPicture.asset(
//                           "assets/icons/back.svg",
//                           color: navy,
//                         ),
//                         onPressed: () => Navigator.pushReplacement(context,
//                             MaterialPageRoute(builder: (context) => LPage()))),
//                   ),
//                   // Container(
//                   //   child: IconButton(
//                   //     iconSize: 20,
//                   //     color: white,
//                   //     icon: SvgPicture.asset(
//                   //       "assets/icons/3dots.svg",
//                   //       color: navy,
//                   //     ),
//                   //     onPressed: () {},
//                   //   ),
//                   // ),
//                 ],
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.01.h,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 28.0),
//                 child: Text(
//                   "Verify your Mobile no.",
//                   style: GoogleFonts.mulish(
//                       fontWeight: FontWeight.bold, fontSize: 21),
//                   textAlign: TextAlign.left,
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.02.h,
//               ),
//               Text(
//                 "We sent OTP code to your Mobile",
//                 style: hStyle,
//                 textAlign: TextAlign.left,
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.05.h,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.number,
//                 validator: MultiValidator([
//                   RequiredValidator(errorText: otpnull),
//                   MaxLengthValidator(6, errorText: otpnlength),
//                   MinLengthValidator(6, errorText: otpnlength)
//                 ]),
//                 controller: otpController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: "Enter OTP",
//                   hintStyle: GoogleFonts.mulish(
//                       fontWeight: FontWeight.w500, fontSize: 17),
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.05.h),
//               Container(
//                 width: MediaQuery.of(context).size.width * .45.w,
//                 height: MediaQuery.of(context).size.height * .05.h,
//                 child: Material(
//                   borderRadius: BorderRadius.circular(20.0),
//                   color: gold,
//                   elevation: 5.0,
//                   child: TextButton(
//                     onPressed: () {
//                       if (otppagekey.currentState!.validate()) {
//                         PhoneAuthCredential phoneAuthCredential =
//                             PhoneAuthProvider.credential(
//                                 verificationId: verificationID,
//                                 smsCode: otpController.text);

//                         signInWithPhoneAuthCredential(phoneAuthCredential);
//                       }
//                       // ignore: unused_local_variable
//                     },
//                     child: Center(
//                         child: Text('Submit',
//                             style: GoogleFonts.mulish(
//                                 fontWeight: FontWeight.bold,
//                                 color: white,
//                                 fontSize: 20.sp))),
//                   ),
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.025.h),
//               Container(
//                   height: MediaQuery.of(context).size.height * .05.h,
//                   width: MediaQuery.of(context).size.width * .4.w,
//                   child: Material(
//                     borderRadius: BorderRadius.circular(20.0),
//                     color: white,
//                     elevation: 4.0,
//                     child: TextButton(
//                       onPressed: () => Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) => LPage())),
//                       child: Center(
//                         child: Text(
//                           'Back',
//                           style: GoogleFonts.mulish(
//                             fontSize: 18.sp,
//                             color: navy,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void signInWithPhoneAuthCredential(
//       PhoneAuthCredential phoneAuthCredential) async {
//     setState(() {
//       showLoading = true;
//     });
//     try {
//       final authcredential =
//           await _auth.signInWithCredential(phoneAuthCredential);
//       setState(() {
//         showLoading = false;
//       });
//       if (authcredential.user != null) {
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => Mainhome()));
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         showLoading = false;
//       });

//       _scaffoldKey.currentState!
//           // ignore: deprecated_member_use
//           .showSnackBar(SnackBar(content: Text(e.message.toString())));
//     }
//   }
// }
