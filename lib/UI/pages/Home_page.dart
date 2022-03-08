import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

class Homepagescreen extends StatefulWidget {
  const Homepagescreen({Key? key}) : super(key: key);

  @override
  State<Homepagescreen> createState() => _HomepagescreenState();
}

class _HomepagescreenState extends State<Homepagescreen> {
  @override
  Widget build(BuildContext context) {
    // void onback() {
    //   AwesomeDialog(
    //     dialogBackgroundColor: white,
    //     context: context,
    //     dialogType: DialogType.WARNING,
    //     borderSide: BorderSide(color: white, width: 2),
    //     width: 350,
    //     buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
    //     headerAnimationLoop: false,
    //     animType: AnimType.LEFTSLIDE,
    //     title: 'Exit',
    //     desc: 'Are sure you want to exit...',
    //     buttonsTextStyle: dfont,
    //     showCloseIcon: true,
    //     btnCancelOnPress: () {
    //       Navigator.pushNamed(context, homeroute);
    //     },
    //     btnOkOnPress: () {
    //       SystemNavigator.pop();
    //     },
    //   )..show();
    //   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   //   backgroundColor: black,
    //   //   content: Text(
    //   //     "Closing the app",
    //   //     style: dfont,
    //   //   ),
    //   // ));
    //   // Future.delayed(
    //   //   Duration(seconds: 2),
    //   //   () {
    //   //     SystemNavigator.pop();
    //   //   },
    //   // );
    // }

    final translate = AppLocalizations.of(context);
    List language = [translate!.language1, translate.primarylanguage];
    var theme = Provider.of<Themeprovider>(context);
    return NetworkSensitive(
      child: WillPopScope(
          onWillPop: () {
            // onback();
            return Future.value(false);
          },
          child: SafeArea(
              child: Scaffold(
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
                        // Image.asset(
                        //   "assets/images/ILALOGO.png",
                        //   height: height * 0.04.h,
                        // ),
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
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //       Categorypagescrend()));
                                },

                                // => Navigator.pushNamed(
                                //     context, notificationroute),
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
                      "India Finest Advocate \nPlatform",
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        child: Slisder(),
                        height: 170,
                        // width: width * 1.w,
                      ),
                    ),
                    spaced10,
                    Rowtitle(
                      title: 'Category',
                    ),
                    spaced10,
                    Container(height: 100, child: Categoryshow()),
                    // spaced30,
                    Rowtitle(
                      title: 'Top Lawyer',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Toplawyers(),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 8),
                    //   child: Relawyerlist(),
                    // ),
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
              // backgroundColor: dialog,
              title: Text(
                translate!.languagekey,
                // style: dfont,
              ),
              // actionsPadding: EdgeInsets.symmetric(horizontal: 1.w),
              actions: [
                TextButton(
                    onPressed: () {
                      context.read<Languagenotifier>().changelanguage("en");
                      Navigator.pop(context);
                    },
                    child: Text(
                      translate.primarylanguage,
                      style: TextStyle(color: appcolor),

                      // style: dfont,
                    )),
                TextButton(
                    onPressed: () {
                      context.read<Languagenotifier>().changelanguage("ta");
                      Navigator.pop(context);
                    },
                    child: Text(
                      translate.language1, style: TextStyle(color: appcolor),

                      // style: dfont,
                    ))
              ],
            ));
  }
}
