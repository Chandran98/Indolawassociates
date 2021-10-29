import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import '../../../main.dart';


class Notific extends StatefulWidget {
  const Notific({Key? key}) : super(key: key);

  @override
  _NotificState createState() => _NotificState();
}

class _NotificState extends State<Notific> {
  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Mainhome()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: navy,
            title: Text(
              "Notification",
              style: GoogleFonts.mulish(color: Colors.white),
            ),
            leading: IconButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Mainhome())),
                icon: Icon(Icons.arrow_back, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
