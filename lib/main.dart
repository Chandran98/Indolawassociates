// ignore: import_of_legacy_library_into_null_safe
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Client/Pages/Homepage/drawer.dart';
import 'Client/Pages/Homepage/home.dart';
import 'Client/Pages/Register_Login_screen/Login.dart/LOGINpage.dart';
import 'Client/Pages/bottomnavybar/Legalforms.dart';
import 'Client/Pages/bottomnavybar/Para_legal_services/para_legal_services.dart';
import 'Client/constants/constant.dart';
import 'Client/Pages/Register_Login_screen/Login.dart/log.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(
    MyApp(),
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) =>MyApp()
    // )
          );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (ScreenUtilInit(designSize: Size(390, 690),
      builder:()=> MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),)
    );
  }
}

///////Splash screen////////

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  // void initState() {
  //   super.initState();
  //   Timer(
  //       Duration(seconds: 4),
  //       () => Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => Intro())));
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: MediaQuery.of(context).size.width * 0.8.h,
        splash: Image.asset("assets/images/ILAlogopvt.png",fit: BoxFit.contain,),
        nextScreen: Loginpage());
    // return Container(color: white,
    //   child: Center(
    //     child: Image.asset("assets/images/ILALOGO.png",height: MediaQuery.of(context).size.height*0.32,),
    // Text(
    //   " ILA \nLOGO ",
    //   style: GoogleFonts.mulish(
    //       fontSize: 60,
    //       fontWeight: FontWeight.bold,
    //       color: white,
    //       decoration: TextDecoration.none),
    // ),
    // ),
    // decoration: BoxDecoration(
    //   // gradient: LinearGradient(
    //   //     colors: [Colors.purple, Colors.red],
    //   //     begin: Alignment.bottomCenter,
    //   //     end: Alignment.topCenter),
    //   color: Colors.white,
    //          image: DecorationImage(
    //            image: AssetImage(
    //              "assets/images/ILALOGO.png",
    //            ),
    //            )
    // ),
    // );
  }
}

///Bottombar//

class Mainhome extends StatefulWidget {
  const Mainhome({Key? key}) : super(key: key);

  @override
  _MainhomeState createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {
  int index = 0;
  @override
  // ignore: must_call_super

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Maindrawer(),
        bottomNavigationBar: BottomNavyBar(
            backgroundColor: white,
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                  inactiveColor: Color(0xFFFDD8B5),
                  activeColor: Colors.lightBlue,
                  icon: Icon(Icons.home, color: navy),
                  title: Text("Home",
                      style: GoogleFonts.mulish(color: navy, fontSize: 18.sp))),
              BottomNavyBarItem(
                inactiveColor: Color(0xffB4B4E4),
                activeColor: Colors.lightBlue,
                icon: Icon(Icons.book_online_outlined, color: navy),
                title: Text(
                  "Services",
                  style: hStyle,
                ),
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.library_books, color: navy),
                title: Text(
                  "Legal forms",
                  style: hStyle,
                ),
                inactiveColor: Color(0xffB4B4E4),
                activeColor: Colors.lightBlue,
              ),
              // BottomNavyBarItem(
              //     inactiveColor: Color(0xFF9393EE),
              //     activeColor: Colors.lightBlue,
              //     icon: Icon(Icons.payment, color: navy),
              //     title: Text(
              //       "Payment",
              //       style: hStyle,
              //     ))
            ],
            selectedIndex: index,
            onItemSelected: (index) => setState(() => this.index = index)),
        body: buildPages());
  }

  Widget buildPages() {
    switch (index) {
      case 1:
        return Paralegal();
      // case 3:
      //   return Paymentbar();
      case 2:
        return Legal();
      case 0:
      default:
        return HomeScreen();
    }
  }
}
