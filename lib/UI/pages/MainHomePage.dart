import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/UI/pages/notification.dart';
import 'package:indolawassociates/UI/services/notification_services.dart';

class MainHomepage extends StatefulWidget {
  MainHomepage({Key? key}) : super(key: key);

  @override
  _MainHomepageState createState() => _MainHomepageState();
}

class _MainHomepageState extends State<MainHomepage>
    with TickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("Notification");
          if (message.data['_id'] != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Notificationpage(
                  // id: message.data['_id'],
                ),
              ),
            );
          }
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
    tabController = TabController(length: 4, vsync: this);
  }

  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainHomepage()));
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    return SafeArea(
      child: Scaffold(
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: pages),

          // DoubleBackToCloseApp(
          //   snackBar: const SnackBar(
          //     backgroundColor: black,
          //     content: Text(
          //       'Tap back again to exit app.',
          //       style: TextStyle(fontSize: 18),
          //     ),
          //   ),
          //   child:
          // ),
          bottomNavigationBar: SizedBox(
            height: kBottomNavigationBarHeight,
            child: BottomAppBar(
              // color: black,
              child: TabBar(
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  indicator: const UnderlineTabIndicator(
                      insets:
                          EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                      borderSide: BorderSide(width: 4, color: appcolor)),
                  // labelColor: green,
                  // indicatorColor: green,
                  // unselectedLabelColor: white,
                  controller: tabController,
                  tabs: [
                    Tab(
                      iconMargin: EdgeInsets.only(bottom: 4),
                      icon: Icon(CupertinoIcons.home),
                      // icon: selectedIndex == 0
                      //     ? const Icon(Icons.home)
                      //     : const Icon(Icons.home_mini),
                      child: Text(
                        translate!.navkey1,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Tab(
                      iconMargin: EdgeInsets.only(bottom: 4),
                      icon: Icon(
                        CupertinoIcons.list_bullet,
                        // size: 25.w,
                      ),
                      child: Text(
                        translate.navkey2,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Tab(
                      iconMargin: EdgeInsets.only(bottom: 4),
                      icon: Icon(CupertinoIcons.shield_lefthalf_fill),
                      child: Text(
                        translate.navkey3,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Tab(
                      iconMargin: EdgeInsets.only(bottom: 4),
                      icon: Icon(CupertinoIcons.profile_circled),
                      child: FittedBox(
                        child: Text(
                          translate.profile,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    )
                  ]),
            ),
          )),
    );
  }
}
