// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:double_back_to_close_app/double_back_to_close_app.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:indolawassociates/Client/Pages/Register_Login_screen/Login/Login_page.dart';
// import 'package:indolawassociates/Client/constants/constant.dart';
// import 'package:sms_autofill/sms_autofill.dart';

// import '../../../../main.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// class OTppage extends StatefulWidget {
//   OTppage({Key? key}) : super(key: key);

//   @override
//   _OTppageState createState() => _OTppageState();
// }

// class _OTppageState extends State<OTppage> {


//   Loginpage loginpage=Loginpage();
//   final _formKeyOTP = GlobalKey<FormState>();
//   final _scaffoldKey = GlobalKey<ScaffoldState>();

//   final TextEditingController numberController = new TextEditingController();
//   final TextEditingController otpController = new TextEditingController();

//   var isLoading = false;
//   var isResend = false;
//   var isLoginScreen = true;
//   var isOTPScreen = false;
//   var verificationCode = '';
//   late String phone;
//   late String otpcoder;

//   void _listenotp() async {
//     await SmsAutoFill().listenForCode();
//   }

//   @override
//   void initState() {
//     _listenotp();
//     super.initState();
//   }

//   @override
//   void dispose() {
//         SmsAutoFill().unregisterListener();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           key: _scaffoldKey,
//           body: DoubleBackToCloseApp(
//             snackBar: const SnackBar(
//               backgroundColor: navy,
//               content: Text(
//                 'Tap back again to exit app.',
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: Column(children: [
//                   Form(
//                     key: _formKeyOTP,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                             child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 60.0, horizontal: 20.0),
//                                 child: Text(
//                                   !isLoading
//                                       ? "Verify Your OTP "
//                                       : "Verifying OTP code via SMS",
//                                   textAlign: TextAlign.center,
//                                   style: GoogleFonts.mulish(
//                                       fontSize: 20.sp,
//                                       color: navy,
//                                       fontWeight: FontWeight.bold),
//                                 ))),
//                         !isLoading
//                             ? Container(
//                                 child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         vertical: 10.0, horizontal: 10.0),
//                                     child: PinFieldAutoFill(
//                                       codeLength: 6,
//                                       onCodeChanged: (val) {
//                                         otpcoder = val!;
//                                         // FocusScope.of(context)
//                                         //     .requestFocus(FocusNode());
//                                       },
//                                       keyboardType: TextInputType.number,
//                                       autoFocus: true,
//                                     )

//                                     //  TextFormField(
//                                     //   enabled: !isLoading,
//                                     //   controller: otpController,
//                                     //   keyboardType: TextInputType.number,
//                                     //   // inputFormatters: <TextInputFormatter>[
//                                     //   //   FilteringTextInputFormatter.digitsOnly
//                                     //   // ],
//                                     //   initialValue: null,
//                                     //   autofocus: true,
//                                     //   decoration: InputDecoration(
//                                     //       labelText: 'OTP',
//                                     //       labelStyle: GoogleFonts.mulish(
//                                     //           fontSize: 18,
//                                     //           color: navy,
//                                     //           fontWeight: FontWeight.bold)),
//                                     //   validator: (value) {
//                                     //     if (value!.isEmpty) {
//                                     //       return 'Please enter OTP';
//                                     //     }
//                                     //   },
//                                     // ),
//                                     ))
//                             : Container(),
//                         !isLoading
//                             ? Container(
//                                 margin: EdgeInsets.only(top: 40, bottom: 5),
//                                 child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0),
//                                     child: new TextButton(
//                                       onPressed: () async {
//                                         if (_formKeyOTP.currentState!
//                                             .validate()) {
//                                           if (mounted)
//                                             setState(() {
//                                               isResend = false;
//                                               isLoading = true;
//                                             });
//                                           try {
//                                             await _auth
//                                                 .signInWithCredential(
//                                                     PhoneAuthProvider.credential(
//                                                         verificationId:
//                                                             verificationCode,
//                                                         smsCode: otpcoder
//                                                             .toString()))
//                                                 .then((user) async => {
//                                                       if (user != null)
//                                                         {
//                                                           if (mounted)
//                                                             setState(() {
//                                                               isLoading = false;
//                                                               isResend = false;
//                                                             }),
//                                                           Navigator
//                                                               .pushAndRemoveUntil(
//                                                             context,
//                                                             MaterialPageRoute(
//                                                               builder: (BuildContext
//                                                                       context) =>
//                                                                   Mainhome(),
//                                                             ),
//                                                             (route) => false,
//                                                           )
//                                                         }
//                                                     })
//                                                 .catchError((error) => {
//                                                       if (mounted)
//                                                         setState(() {
//                                                           isLoading = false;
//                                                           isResend = true;
//                                                         }),
//                                                     });
//                                             if (mounted)
//                                               setState(() {
//                                                 isLoading = true;
//                                               });
//                                           } catch (e) {
//                                             if (mounted)
//                                               setState(() {
//                                                 isLoading = false;
//                                               });
//                                           }
//                                         }
//                                       },
//                                       child: new Container(
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 .6.w,
//                                         height:
//                                             MediaQuery.of(context).size.height *
//                                                 .07.h,
//                                         child: Material(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           elevation: 4,
//                                           color: gold,
//                                           child: Center(
//                                               child: Text('Submit',
//                                                   style: GoogleFonts.mulish(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: white,
//                                                       fontSize: 20))),
//                                         ),
//                                       ),
//                                     )))
//                             : Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: <Widget>[
//                                         CircularProgressIndicator(
//                                           backgroundColor: Colors.red,
//                                         )
//                                       ].where((c) => c != null).toList(),
//                                     )
//                                   ]),
//                         isResend
//                             ? Container(
//                                 margin: EdgeInsets.only(top: 20),
//                                 child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0),
//                                     child: new TextButton(
//                                       onPressed: () async {
//                                         if (mounted)
//                                           setState(() {
//                                             isResend = false;
//                                             isLoading = true;
//                                           });
//                                         await login();
//                                       },
//                                       child: new Container(
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 .6.w,
//                                         height:
//                                             MediaQuery.of(context).size.height *
//                                                 .07.h,
//                                         child: Material(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           elevation: 4,
//                                           color: white,
//                                           child: Center(
//                                               child: Text('Resend Code',
//                                                   style: GoogleFonts.mulish(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: navy,
//                                                       fontSize: 20))),
//                                         ),
//                                       ),
//                                     )))
//                             : Column()
//                       ],
//                     ),
//                   )
//                 ]),
//               ),
//             ),
//           )),
//     );
//   }

//   // Future login() async {
//   //   if (mounted)
//   //     setState(() {
//   //       isLoading = true;
//   //     });

//   //   // var phoneNumber = numberController.text.trim();
//   //   var phoneNumber = phone;

//   //   var isValidUser = false;
//   //   // var number = numberController.text.trim();
//   //   var number = phone;

//   //   await _firestore
//   //       .collection('ILA')
//   //       .where('cellnumber', isEqualTo: number)
//   //       .get()
//   //       .then((result) {
//   //     if (result.docs.length > 0) {
//   //       isValidUser = true;
//   //     }
//   //   });

//   //   if (isValidUser) {
//   //     var verifyPhoneNumber = _auth.verifyPhoneNumber(
//   //       phoneNumber: phoneNumber,
//   //       verificationCompleted: (phoneAuthCredential) {
//   //         _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
//   //               if (user != null)
//   //                 {
//   //                   if (mounted)
//   //                     {
//   //                       setState(() {
//   //                         isLoading = false;
//   //                         isOTPScreen = false;
//   //                       }),
//   //                     },
//   //                   Navigator.pushAndRemoveUntil(
//   //                     context,
//   //                     MaterialPageRoute(
//   //                       builder: (BuildContext context) => Mainhome(),
//   //                     ),
//   //                     (route) => false,
//   //                   )
//   //                 }
//   //             });
//   //       },
//   //       verificationFailed: (FirebaseAuthException error) {
//   //         displaySnackBar('Validation error, please try again later');
//   //         if (mounted)
//   //           setState(() {
//   //             isLoading = false;
//   //           });
//   //       },
//   //       codeSent: (verificationId, [forceResendingToken]) {
//   //         if (mounted)
//   //           setState(() {
//   //             isLoading = false;
//   //             verificationCode = verificationId;

//   //             isOTPScreen = true;
//   //           });
//   //       },
//   //       codeAutoRetrievalTimeout: (String verificationId) {
//   //         if (mounted)
//   //           setState(() {
//   //             isLoading = false;

//   //             verificationCode = verificationId;
//   //           });
//   //       },
//   //       timeout: Duration(seconds: 60),
//   //     );
//   //     await verifyPhoneNumber;
//   //   } else {
//   //     if (mounted) {
//   //       setState(() {
//   //         isLoading = false;
//   //       });
//   //     }
//   //     displaySnackBar('Number not found, please sign up first');
//   //   }
//   // }

//   // displaySnackBar(text) {
//   //   final snackBar = SnackBar(content: Text(text));
//   //   _scaffoldKey.currentState!.showSnackBar(snackBar);
//   // }
// }
