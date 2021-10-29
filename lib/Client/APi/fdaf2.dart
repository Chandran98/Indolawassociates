// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:indolawassociates/Client/Pages/Register_Login_screen/Login.dart/Login.dart';
// import 'package:indolawassociates/main.dart';

// class OTpscreen extends StatefulWidget {
//   OTpscreen(this.phone);
//   final String phone;

//   @override
//   _OTpscreenState createState() => _OTpscreenState();
// }

// class _OTpscreenState extends State<OTpscreen> {
//   final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
//   late String _verificationCode;
//   final TextEditingController _pinPutController = TextEditingController();
//   final FocusNode _pinPutFocusNode = FocusNode();
//   final BoxDecoration pinPutDecoration = BoxDecoration(
//     color: const Color.fromRGBO(43, 46, 66, 1),
//     borderRadius: BorderRadius.circular(10.0),
//     border: Border.all(
//       color: const Color.fromRGBO(126, 203, 224, 1),
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldkey,
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 40),
//             child: Center(
//               child: Text(
//                 'Verify +1-${widget.phone}',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: PinPut(
//               fieldsCount: 6,
//               textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
//               eachFieldWidth: 40.0,
//               eachFieldHeight: 55.0,
//               focusNode: _pinPutFocusNode,
//               controller: _pinPutController,
//               submittedFieldDecoration: pinPutDecoration,
//               selectedFieldDecoration: pinPutDecoration,
//               followingFieldDecoration: pinPutDecoration,
//               pinAnimationType: PinAnimationType.fade,
//               onSubmit: (pin) async {
//                 try {
//                   await FirebaseAuth.instance
//                       .signInWithCredential(PhoneAuthProvider.credential(
//                           verificationId: _verificationCode, smsCode: pin))
//                       .then((value) async {
//                     if (value.user != null) {
//                       Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(builder: (context) => Mainhome()),
//                           (route) => false);
//                     }
//                   });
//                 } catch (e) {
//                   FocusScope.of(context).unfocus();
//                   _scaffoldkey.currentState!
//                       .showSnackBar(SnackBar(content: Text('invalid OTP')));
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   _verifyphone() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: "${widget.phone}",
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await FirebaseAuth.instance
//               .signInWithCredential(credential)
//               .then((value) async {
//             if (value.user != null) {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginPage()),
//                   (route) => false);
//             }
//           });
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print(e.message);
//         },
//         codeSent: (verificationid, resendtoken) {
//           setState(() {
//             _verificationCode = verificationid;
//           });
//         },
//         codeAutoRetrievalTimeout: (verificationid) {
//           setState(() {
//             _verificationCode = verificationid;
//           });
//         },
//         timeout: Duration(seconds: 60));
//   }
// }
