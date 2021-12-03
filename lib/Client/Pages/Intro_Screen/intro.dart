// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:indolawassociates/Client/Pages/Register_Login_screen/Login.dart/Login.dart';
// import 'package:indolawassociates/Client/constants/constant.dart';
// import 'package:introduction_screen/introduction_screen.dart';

// // ignore: must_be_immutable
// class Intro extends StatelessWidget {
//   static const black = const Color(0xFF1b1b1b);
//   static const text = const Color(0xFF323232);
//   @override
//   Widget build(BuildContext context) {
    
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: black,
//         body: IntroductionScreen(
//           showDoneButton: true,
//           showSkipButton: true,
//           showNextButton: false,
//           dotsDecorator: DotsDecorator(
//               size: Size(8, 8),
//               activeSize: Size(12, 12),
//               activeShape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25)),
//               activeColor: navy,
//               spacing: EdgeInsets.all(5)),
//           skipColor: black,
//           done: Text("Done",
//               style: GoogleFonts.mulish(
//                   fontSize: 20, fontWeight: FontWeight.bold, color: navy)),
//           skip: Text("Skip",
//               style: GoogleFonts.mulish(
//                   fontSize: 20, fontWeight: FontWeight.bold, color: navy)),
//           globalBackgroundColor: white,
//           pages: getPages(),
//           onDone: () => Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => LoginPage())),
//           onSkip: () => Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => LoginPage())),
//         ),
//       ),
//     );
//   }

//   List<PageViewModel> getPages() {
//     return [
//       PageViewModel(
//         title: "Demand For Lawyers We’re Here",
//         body:
//             "Lorem ipsum dolor sit amet, consectetur adipiscingelit, sed do eiusmod tempor incididunt ut labore etdolore magna aliqua",
//         decoration: PageDecoration(
//             boxDecoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage("assets/images/intro_screen1.jpg"),
//                     colorFilter:
//                         ColorFilter.mode(Colors.black45, BlendMode.darken),
//                     fit: BoxFit.fill)),
//             titleTextStyle: GoogleFonts.mulish(
//                 fontSize: 30, fontWeight: FontWeight.bold, color: white),
//             bodyTextStyle: GoogleFonts.mulish(fontSize: 20, color: white),
//             bodyAlignment: Alignment.center),
//       ),
//       PageViewModel(
//         title: "Consectetur angelit ed do eiusmod ?",
//         body:
//             "Lorem ipsum dolor sit amet, consectetur adipiscingelit, sed do eiusmod tempor incididunt ut labore etdolore magna aliqua",
//         decoration: PageDecoration(
//             boxDecoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage("assets/images/intro_screen2.jpg"),
//                     colorFilter:
//                         ColorFilter.mode(Colors.black45, BlendMode.darken),
//                     fit: BoxFit.fill)),
//             titleTextStyle: GoogleFonts.mulish(
//                 fontSize: 30, fontWeight: FontWeight.bold, color: white),
//             bodyTextStyle: GoogleFonts.mulish(fontSize: 20, color: white),
//             bodyAlignment: Alignment.bottomCenter),
//       ),
//       PageViewModel(
//         title: "We’ve Advocates to solve all of your issues!",
//         body:
//             "Lorem ipsum dolor sit amet, consectetur adipiscingelit, sed do eiusmod tempor incididunt ut labore etdolore magna aliqua",
//         decoration: PageDecoration(
//             boxDecoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage("assets/images/intro_screen3.jpg"),
//                     colorFilter:
//                         ColorFilter.mode(Colors.black26, BlendMode.darken),
//                     fit: BoxFit.fill)),
//             titleTextStyle: GoogleFonts.mulish(
//                 fontSize: 30, fontWeight: FontWeight.bold, color: white),
//             bodyTextStyle: GoogleFonts.mulish(fontSize: 20, color: white),
//             bodyAlignment: Alignment.bottomCenter),
//       )
//     ];
//   }
// }
