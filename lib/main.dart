// ignore: import_of_legacy_library_into_null_safe
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:indolawassociates/Client/l10n/l10n.dart';
import 'package:indolawassociates/UI/provider/languageprovider.dart';
import 'package:indolawassociates/Client/utils/Internet%20connectivity/connectivity.dart';
import 'package:indolawassociates/UI/pages/Login/loginpage.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'Client/Pages/Homepage/drawer.dart';
import 'Client/Pages/Homepage/home.dart';
import 'Client/Pages/bottomnavybar/Legalforms.dart';
import 'Client/Pages/bottomnavybar/NRI.dart';
import 'Client/Pages/bottomnavybar/Para_legal_services/para_legal_services.dart';
import 'Client/constants/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  // DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifier()
        ChangeNotifierProvider(create: (context) => Languagenotifier()),
        // ChangeNotifierProvider(create: (context) => Locationprovider()),

        // ChangeNotifierProvider(create: (context) => THemeprovider()),
        StreamProvider<ConnectivityStatus>(
            create: (_) => ConnectivityService().streamController.stream,
            initialData: ConnectivityStatus.Offline)
      ],
      child: Consumer(builder: (_, notifier, child) {
        return Builder(builder: (context) {
          // ScreenUtilInit(
          //     designSize: Size(360, 710),
          //     builder: () {
          return Sizer(
              builder: (context, orientation, deviceType) => MaterialApp(
                    locale: Provider.of<Languagenotifier>(context, listen: true)
                        .currentlocale,
                    localizationsDelegates: const [
                      GlobalCupertinoLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      AppLocalizations.delegate,
                    ],
                    supportedLocales: L10n.all,
                    debugShowCheckedModeBanner: false,
                    home: SplashScreen(),
                    routes: routes,
                    // theme: notifier.darktheme ? dip :lite,

                    // routes: {
                    //   Settingspage.id: (context) => Settingspage(),
                    //   Testingpage.id: (context) => Testingpage()
                    // },
                  )
              //  Consumer<Themenotifier>(
              //     builder: (_, Themenotifier notifier, child) {
              //   return
              // }
              // );
              // });
              );
        });
      }),
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
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 1000,
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: MediaQuery.of(context).size.width * 0.8.h,
        splash: Image.asset(
          "assets/images/ILAlogopvt.png",
          fit: BoxFit.contain,
        ),
        nextScreen: Loginscreen());
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
    final translate = AppLocalizations.of(context);

    return Scaffold(
        drawer: Maindrawer(),
        bottomNavigationBar: BottomNavyBar(
            backgroundColor: white,
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                  inactiveColor: CupertinoColors.systemGrey,
                  activeColor: Colors.black,
                  icon: Icon(
                    CupertinoIcons.home,
                  ),
                  title: Text("")),
              BottomNavyBarItem(
                // inactiveColor: Color(0xffB4B4E4),
                // activeColor: Colors.lightBlue,
                icon: Icon(Icons.book_online_outlined, color: navy),
                title: Text("."),
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.library_books, color: navy),
                title: Text(
                  translate!.navkey3,
                  style: hStyle,
                ),
                inactiveColor: Color(0xffB4B4E4),
                activeColor: Colors.lightBlue,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.groups_rounded, color: navy),
                title: Text(
                  translate.navkey4,
                  style: hStyle,
                ),
                // inactiveColor: Color(0xffB4B4E4),
                // activeColor: Colors.lightBlue,
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
      case 3:
        return NRI();

      case 0:
      default:
        return HomeScreen();
    }
  }
}
