
import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:indolawassociates/UI/routes/route.dart';

class Notificationpage extends StatefulWidget {
  Notificationpage({Key? key}) : super(key: key);

  @override
  _NotificationpageState createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
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
            toolbarHeight: 70,
            centerTitle: true,
            title: Text(
              "Notification",
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
                onPressed: () => Navigator.pushNamed(context, homeroute),
                icon: const Icon(
                  Icons.arrow_back,
                )),
          ),
        ),
      ),
    );
  }
}
