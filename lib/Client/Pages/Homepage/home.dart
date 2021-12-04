import 'package:carousel_slider/carousel_slider.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Categories.dart/Categories_Pages.dart';
import 'package:indolawassociates/Client/Pages/darwerlist.dart/Offers.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/components/slider/slider.dart';
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

  final List<String> slider = [
    "assets/images/01.jpg",
    "assets/images/02.jpg",
    "assets/images/03.jpg",
  ];
  List<Widget> cslide() {
    return slider
        .map((e) => InkWell(
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Offers())),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  e,
                  fit: BoxFit.fill,
                ),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: white,
      floatingActionButton: FloatingActionButton.extended(
          label: Text(translate!.quickcall),
          icon: Icon(
            Icons.call,
            size: 20.r,
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
        child: SafeArea(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: IconButton(
                                        iconSize: 40.r,
                                        color: white,
                                        icon: SvgPicture.asset(
                                          "assets/icons/menu.svg",
                                          color: navy,
                                        ),
                                        onPressed: () =>
                                            Scaffold.of(context).openDrawer()),
                                  ),
                                  // Container(height: MediaQuery.of(context).size.height*0.1.h,width: MediaQuery.of(context).size.width*0.3.w,
                                  //   child:Image.asset("assets/images/ILA_Logo1.png")
                                  // ),
                                ],
                              ),
                              Container(
                                child: IconButton(
                                  iconSize: 20.r,
                                  color: white,
                                  icon: SvgPicture.asset(
                                    "assets/icons/notification.svg",
                                    color: navy,
                                  ),
                                  onPressed: () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Slisder())),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.016,
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
                          height: MediaQuery.of(context).size.height * 0.02.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Slisder(),
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
                          height: MediaQuery.of(context).size.height * 0.021.h,
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
                          height: MediaQuery.of(context).size.height * 0.012.h,
                        ),
                        Categorycardlist(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0131.h,
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
        ),
      ),
    );
  }
}
