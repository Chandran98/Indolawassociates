// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:indolawassociates/UI/pages/splashscren.dart';
import 'package:indolawassociates/UI/provider/languageprovider.dart';
import 'package:indolawassociates/UI/provider/theme.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/services/notification_services.dart';
import 'package:indolawassociates/UI/themes/themes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'UI/components/Internet connectivity/connectivity.dart';
import 'UI/l10n/l10n.dart';
import 'UI/pages/notification.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Languagenotifier()),
        ChangeNotifierProvider(create: (context) => Themeprovider()),
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
              //     builder: (context, o0rientation, deviceType) =>
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
            theme: Provider.of<Themeprovider>(context).darktheme
                ? darkmode
                : lightmode,

          );
        });
      }),
    );
  }
}

///////Splash screen////////
