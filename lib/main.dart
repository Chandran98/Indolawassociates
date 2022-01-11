// ignore: import_of_legacy_library_into_null_safe
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:indolawassociates/UI/provider/languageprovider.dart';
import 'package:indolawassociates/UI/pages/Login/loginpage.dart';
import 'package:indolawassociates/UI/provider/location_provider.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'UI/components/Internet connectivity/connectivity.dart';
import 'UI/constant/constant.dart';
import 'UI/l10n/l10n.dart';

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
          return
              //  Sizer(
              //     builder: (context, orientation, deviceType) =>
              MaterialApp(
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
          );
          //  Consumer<Themenotifier>(
          //     builder: (_, Themenotifier notifier, child) {
          //   return
          // }
          // );
          // });
          // );
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
        splashIconSize: 250,
        splash: Image.asset(
          "assets/images/ILAlogopvt.png",
          fit: BoxFit.contain,
        ),
        nextScreen: Loginscreen());
  }
}
