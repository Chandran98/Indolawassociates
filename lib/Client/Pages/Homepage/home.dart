import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Categories.dart/Categories_Pages.dart';
import 'package:indolawassociates/Client/Pages/Homepage/drawer.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/components/slider/slider.dart';
import 'package:indolawassociates/Client/provider/languageprovider.dart';
import 'package:indolawassociates/Client/utils/Internet%20connectivity/Network_status.dart';
import 'package:indolawassociates/UI/pages/MainHomePage.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'lawyers/Lawyerlist_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }

  var selectedlan;

  // List<Widget> cslide() {
  //   return slider
  //       .map((e) => InkWell(
  //             onTap: () => Navigator.pushReplacement(
  //                 context, MaterialPageRoute(builder: (context) => Offers())),
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.all(Radius.circular(10)),
  //               child: Image.asset(
  //                 e,
  //                 fit: BoxFit.fill,
  //               ),
  //             ),
  //           ))
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    List language = [translate!.language1, translate.primarylanguage];

    return NetworkSensitive(
      child: Scaffold(
        drawer: Maindrawer(),
        backgroundColor: white,
        floatingActionButton: FloatingActionButton.extended(
            label: Text(translate.quickcall),
            icon: Icon(
              Icons.call,
              size: 20,
            ),
            backgroundColor: navy,
            onPressed: () {
              launcher("tel: 8940383000");
            }),
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            backgroundColor: navy,
            content: Text(
              'Tap back again to exit app.',
              style: TextStyle(fontSize: 18),
            ),
          ),
          child: Consumer<Languagenotifier>(
            builder: (context, provider, snapshot) {
              return SafeArea(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        iconSize: 40,
                                        color: white,
                                        icon: SvgPicture.asset(
                                          "assets/icons/menu.svg",
                                          color: navy,
                                        ),
                                        onPressed: () =>
                                            Scaffold.of(context).openDrawer()),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        title: Text(
                                                          translate.languagekey,
                                                          style: hStyle,
                                                        ),
                                                        actionsPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        30.w),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                context
                                                                    .read<
                                                                        Languagenotifier>()
                                                                    .changelanguage(
                                                                        "en");
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                translate
                                                                    .primarylanguage,
                                                                style: hStyle,
                                                              )),
                                                          TextButton(
                                                              onPressed: () {
                                                                context
                                                                    .read<
                                                                        Languagenotifier>()
                                                                    .changelanguage(
                                                                        "ta");
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                translate
                                                                    .language1,
                                                                style: hStyle,
                                                              ))
                                                        ],
                                                      ));
                                            },
                                            child: Container(
                                                child: Text(
                                              translate.language,
                                              style: hStyle,
                                            )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: IconButton(
                                                iconSize: 20,
                                                color: white,
                                                icon: SvgPicture.asset(
                                                  "assets/icons/notification.svg",
                                                  color: navy,
                                                ),
                                                onPressed: () =>
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                MainHomepage())),
                                              ),
                                            ),
                                          ),
                                        ]),

                                    // Row(
                                    //   crossAxisAlignment:
                                    //       CrossAxisAlignment.center,
                                    //   children: [

                                    //     ],
                                    // )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.016,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  translate.hometitle,
                                  textScaleFactor: 1,
                                  style: GoogleFonts.mulish(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.sp,
                                    color: navy,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: NetworkSensitive(child: Slisder()),
                              ),

                              // CarouselSlider(
                              //     items: cslide(),
                              //     options: CarouselOptions(
                              //       autoPlayAnimationDuration: Duration(seconds: 1),
                              //       height:
                              //           MediaQuery.of(context).size.height * 0.2.h,
                              //       enlargeCenterPage: true,
                              //       autoPlay: true,
                              //       viewportFraction: 0.8,
                              //     )),
                              SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.021.h,
                              ),
                              ////////////////////////////Categories///////////////////////////
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  translate.hometitle2,
                                  style: GoogleFonts.mulish(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.sp,
                                    color: navy,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.012.h,
                              ),
                              Categorycardlist(),
                              SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.0131.h,
                              ),
                              //////////////////// Top Lawyer list /////////////////////
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Text(translate.hometitle3,
                                    style: GoogleFonts.mulish(
                                        fontSize: 17.sp,
                                        color: navy,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Lawyerlist(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
