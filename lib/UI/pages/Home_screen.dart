import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/Internet%20connectivity/Network_status.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/provider/user_details_provider.dart';
import 'package:indolawassociates/UI/components/search_bar.dart';
import 'package:indolawassociates/UI/provider/languageprovider.dart';
import 'package:indolawassociates/UI/provider/theme.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/widgets/categories/Category_list_page.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/Lawyers/Lawyer_list.dart';

class Homepagescreen extends StatefulWidget {
  const Homepagescreen({Key? key}) : super(key: key);

  @override
  State<Homepagescreen> createState() => _HomepagescreenState();
}

class _HomepagescreenState extends State<Homepagescreen> {
  @override
  Widget build(BuildContext context) {
    void onback() {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        borderSide: BorderSide(color: white, width: 2),
        width: 350,
        buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
        headerAnimationLoop: false,
        animType: AnimType.LEFTSLIDE,
        title: 'Exit',
        desc: 'Are sure you want to exit...',
        buttonsTextStyle: dfont,
        showCloseIcon: true,
        btnCancelOnPress: () {
          Navigator.pushNamed(context, homeroute);
        },
        btnOkOnPress: () {
          SystemNavigator.pop();
        },
      )..show();
    }

    return NetworkSensitive(
      child: WillPopScope(
          onWillPop: () {
            onback();
            return Future.value(false);
          },
          child: SafeArea(
              child: Scaffold(
            floatingActionButton: FloatingActionButton.extended(
                label: Text(
                  "Quick call",
                  style: TextStyle(color: white),
                ),
                icon: Icon(
                  Icons.call,
                  size: 20,
                  color: white,
                ),
                onPressed: () {
                  launch("tel: 04443511235");
                }),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Homepageappbar(),
                    Searchbar(),
                    // Toplawyers(),
                    Categorypage()
                    // Ledacy(),
                    // GRidtitlelist(),
                    // spaced20,
                    // Bannerslider(),
                  ],
                ),
              ),
            ),
          ))),
    );
  }
}

class Homepageappbar extends StatelessWidget {
  const Homepageappbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    List language = [translate!.language1, translate.primarylanguage];
    var theme = Provider.of<Themeprovider>(context);
    var user = Provider.of<Userprovider>(context).currentcuserdata;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(" ",
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: appcolor,
                          fontWeight: FontWeight.w600)),
                  Text("",
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: appcolor2,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      languagebutton(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Lottie.asset("assets/images/language.json"),
                    ),
                  ),
                  spacedwidth10,
                  IconButton(
                      onPressed: () {
                        theme.toggletheme();
                      },
                      icon: Icon(
                        CupertinoIcons.moon_stars,
                        color: appcolor,
                        size: 32,
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, notificationroute);
                      // Navigator.pushNamed(context, loginpageroute);
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => HomePageno()));
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Lottie.asset("assets/images/notify.json"),
                    ),
                  ),
                ],
              ),
            ],
          ),
          spaced10,
          Text(
            translate.hometitle,
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  languagebutton(context) {
    final translate = AppLocalizations.of(context);

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                translate!.languagekey,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      context.read<Languagenotifier>().changelanguage("en");
                      Navigator.pop(context);
                    },
                    child: Text(
                      translate.primarylanguage,
                      style: TextStyle(color: appcolor),
                    )),
                TextButton(
                    onPressed: () {
                      context.read<Languagenotifier>().changelanguage("ta");
                      Navigator.pop(context);
                    },
                    child: Text(
                      translate.language1,
                      style: TextStyle(color: appcolor),
                    ))
              ],
            ));
  }
}
