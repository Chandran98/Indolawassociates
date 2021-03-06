import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/Login_screen.dart';
import 'package:indolawassociates/UI/pages/Dashboard_screen.dart';
import 'package:indolawassociates/UI/routes/route.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//  @override
//   void initState() {
//     // Timer(
//     //     Duration(
//     //       seconds: 3,
//     //     ), () {

//     //   if (_auth.currentUser != null) {
//     //     Navigator.pushReplacementNamed(context, homeroute);
//     //   } else {
//     //     Navigator.pushReplacementNamed(context,loginpageroute);
//     //   }
//     // });
    
//     Timer.run(() {
//       if (_auth.currentUser != null) {
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => MainHomepage(),
//           ),
//           (route) => false,
//         );
//       }
//     });

//     super.initState();


//   }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen( 
        duration: 1000,
        // splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 250,
        splash: Image.asset(
          "assets/images/ILAlogopvt.png",
          fit: BoxFit.contain,
        ), nextScreen: Checkuser(),);
  }
}

class Checkuser extends StatefulWidget {
  const Checkuser({Key? key}) : super(key: key);

  @override
  State<Checkuser> createState() => _CheckuserState();
}

class _CheckuserState extends State<Checkuser> {
  
final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // Timer(
    //     Duration(
    //       seconds: 3,
    //     ), () {

    //   if (_auth.currentUser != null) {
    //     Navigator.pushReplacementNamed(context, homeroute);
    //   } else {
    //     Navigator.pushReplacementNamed(context,loginpageroute);
    //   }
    // });
    
    Timer.run(() {
      if (_auth.currentUser != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MainHomepage(),
          ),
          (route) => false,
        );
      }else{
        Navigator.pushNamed(context, loginpageroute);
      }
    });

    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: white,
      body: Container(),
    );
  }
}