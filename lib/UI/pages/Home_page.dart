import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/Internet%20connectivity/Network_status.dart';
import 'package:indolawassociates/UI/components/Title_card.dart';
import 'package:indolawassociates/UI/components/slider/slider.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/provider/languageprovider.dart';
import 'package:indolawassociates/UI/provider/theme.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/widgets/Lawyers/Lawyer_list.dart';
import 'package:indolawassociates/UI/widgets/categories/Category_list_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

    final translate = AppLocalizations.of(context);
    List language = [translate!.language1, translate.primarylanguage];
    var theme = Provider.of<Themeprovider>(context);
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
                    spaced20,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Hi ",
                                style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    color: appcolor,
                                    fontWeight: FontWeight.w600)),
                            Text("Tamil",
                                style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    color: appcolor2,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  languagebutton(context);
                                },
                                icon: Icon(
                                  Icons.language_outlined,
                                  size: 32,
                                )),
                            spacedwidth10,
                            IconButton(
                                onPressed: () {
                                  theme.toggletheme();
                                },
                                icon: Icon(CupertinoIcons.moon_stars)),
                            spacedwidth10,
                            IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, notificationroute);
                                },
                                icon: Icon(
                                  CupertinoIcons.bell,
                                  size: 32,
                                )),
                          ],
                        ),
                      ],
                    ),
                    spaced20,
                    Text(
                      translate.hometitle,
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        child: Bannerslider(),
                        height: 150,
                      ),
                    ),
                    spaced10,
                    Rowtitle(
                      title: translate.categories,
                    ),
                    spaced10,
                    Container(height: 100, child: Categoryshow()),
                    // spaced30,
                    Rowtitle(
                      title: translate.hometitle3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Toplawyers(),
                    ),
                  ],
                ),
              ),
            ),
          ))),
    );
  }

  languagebutton(_) {
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
