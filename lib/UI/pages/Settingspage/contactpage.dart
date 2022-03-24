import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/socialmedia.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Contactpage extends StatefulWidget {
  Contactpage({Key? key}) : super(key: key);

  @override
  _ContactpageState createState() => _ContactpageState();
}

class _ContactpageState extends State<Contactpage> {
  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }

  void onback() {
    Navigator.of(context).pop();
  }

  var whatsapp = "+91 8940383000";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final translate = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: IconButton(
                            iconSize: 30,
                            splashColor: green,
                            
                            icon:Icon(Icons.arrow_back),
                            onPressed: () =>
                                Navigator.pushNamed(context, settingsroute)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    translate!.cpage,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  Text(
                    translate.helpline1,
                    // textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        // color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    translate.helplinetitle1,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        // color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      color: divcolor,
                    ),
                  ),
                  SizedBox(height: 20),
                  Boxshape(
                    link:
                        "https://wa.me/$whatsapp?text= Hi, I have an emergency",
                    text: translate.whatsapp,
                    icon: FaIcon(
                      FontAwesomeIcons.whatsapp,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Boxshape(
                    link: "tel: 8940383000",
                    text: translate.mobile,
                    icon: FaIcon(
                      FontAwesomeIcons.phoneAlt,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Boxshape(
                    link: "mailto: indolawassociates@gmail.com",
                    text: translate.mail,
                    icon: FaIcon(
                      FontAwesomeIcons.mailBulk,
                      color: Color.fromARGB(255, 175, 116, 76),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      color: divcolor,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FittedBox(
                    child: Text(
                      translate.exp,
                      style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    translate.helptitle,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      launch(
                          "https://play.google.com/store/apps/details?id=com.indolawassociates.Indolaw");
                    },
                    child: Image.asset(
                      "assets/icons/star.png",
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Socialmedia()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Boxshape extends StatelessWidget {
  String text, link;
  FaIcon icon;
  Boxshape(
      {Key? key, required this.link, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // ignore: unnecessary_statements
      onTap: () async => await launch(link),
      child: Container(
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(15),
              color: white,
              border: Border.all(color: Color(0xff2748A0))),
          height: 60,
          width: 300,
          // padding: const EdgeInsets.symmetric(
          //   vertical: 15.0,
          //   horizontal: 15.0,
          // ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: GoogleFonts.poppins(
                      // fontWeight: FontWeight.bold,
                      color: black,
                      fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )),
    );
  }
}

// https://play.google.com/store/apps/details?id=com.indolawassociates.Indolaw