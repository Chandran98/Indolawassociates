import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/services/notification_services.dart';

class Notificationpage extends StatefulWidget {
  Notificationpage({Key? key}) : super(key: key);

  @override
  _NotificationpageState createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
        }
      },
    );

    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  onback() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            // elevation: 3,
            toolbarHeight: 70,
            centerTitle: true,
            // backgroundColor: dialog,
            title: Text(
              "Notification",
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
                onPressed: () => Navigator.pushNamed(context, homeroute),
                icon: const Icon(
                  Icons.arrow_back,
                  // color: Colors.white,
                )),
          ),
          body: Container(),
        ),
      ),
    );
  }
}
