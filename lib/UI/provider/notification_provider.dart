import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/services/notification_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notifierprovider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  bool? _subscribe;
  get subscribe => _subscribe;
  int _notificationlength = 0;
  get notificationlength => _notificationlength;
  int _savedlength = 0;
  get savedlength => _savedlength;
  
  int _notificationFinalLength = 0;
  int get notificationFinalLength => _notificationFinalLength;



  Future fcmSubscribe(bool isSubscribed) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setBool('subscribe', isSubscribed);
    pushnotificationsubscription();
  }


  Future initfirebasepushnotification(context) async {
    pushnotificationsubscription();
    String? _token = await firebaseMessaging.getToken();
    RemoteMessage? initalmsg = await firebaseMessaging.getInitialMessage();
    if (initalmsg != null) {
      Navigator.pushNamed(context, homeroute);
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      LocalNotificationService.createanddisplaynotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      Navigator.pushNamed(context, homeroute);
    });
    notifyListeners();
  }

  Future pushnotificationsubscription() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool _getscription = pref.getBool("subscribe") ?? true;
    if (_getscription == true) {
      await pref.setBool("subscribe", true);
      firebaseMessaging.subscribeToTopic(Constants.fcmSubscriptionTopic);
      _subscribe = true;
      notifyListeners();
    } else {
      await pref.setBool("subscribe", false);
      firebaseMessaging.unsubscribeFromTopic(Constants.fcmSubscriptionTopic);
      _subscribe = false;
      notifyListeners();
    }
  }
}

class Constants {
  static final String fcmSubscriptionTopic = 'all';
}
