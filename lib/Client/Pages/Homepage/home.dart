import 'package:carousel_slider/carousel_slider.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Categories.dart/Categories_Pages.dart';
import 'package:indolawassociates/Client/Pages/Homepage/Maps.dart';
import 'package:indolawassociates/Client/Pages/Register_Login_screen/Sign_Up/dummy.dart';
import 'package:indolawassociates/Client/Pages/darwerlist.dart/Offers.dart';
import 'package:indolawassociates/Client/components/Card_details.dart';
import 'package:indolawassociates/Client/components/lawyer_card.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Notification.dart';

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
  final List<Toplawyerlist> topcom = [
    Toplawyerlist(
        name: "Amos Athisayaraj",
        type: 'ILA Lawyer',
        Image: 'assets/images/malelaw.png',
        Experience: " 2 yrs"),
    Toplawyerlist(
        name: "Illanovan",
        type: 'ILA Lawyer',
        Image: 'assets/images/malelaw.png',
        Experience: " 5yrs"),
    Toplawyerlist(
        name: "Lawrence",
        type: 'ILA Lawyer',
        Image: 'assets/images/malelaw.png',
        Experience: "8 yrs"),
    Toplawyerlist(
        name: "Valenteena Jafflet",
        type: 'ILA Lawyer',
        Image: 'assets/images/flaw.png',
        Experience: "3 yrs"),
    Toplawyerlist(
        name: "Kalavathy",
        type: 'ILA Lawyer',
        Image: 'assets/images/flaw.png',
        Experience: "1yrs"),
    Toplawyerlist(
        name: "Yamuna",
        type: 'ILA Lawyer',
        Image: 'assets/images/flaw.png',
        Experience: "1yrs"),
  
    Toplawyerlist(
        name: "Vivek",
        type: 'ILA Lawyer',
        Image: 'assets/images/malelaw.png',
        Experience: "1yrs"),
    Toplawyerlist(
        name: "Rajkumar",
        type: 'ILA Lawyer',
        Image: 'assets/images/malelaw.png',
        Experience: "1yrs"),];
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
      floatingActionButton: FloatingActionButton.extended(label:Text(translate!.quickcall) ,icon: Icon(Icons.call,size: 20.r,),
          backgroundColor: navy,
        
          onPressed: () {launcher("tel: 8940383000");}),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          backgroundColor: navy,
          content: Text(
            'Tap back again to exit app.',
            style: TextStyle(fontSize: 18),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Row(                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              ),Container(
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
                                          builder: (context) => Maped())),
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
                            translate.hometitle,textScaleFactor: 1,
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
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 30),
                        //   child: SearchBarmap(),
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.021,
                        // ),
                        CarouselSlider(
                            items: cslide(),
                            options: CarouselOptions(
                              autoPlayAnimationDuration: Duration(seconds: 1),
                              height: MediaQuery.of(context).size.height * 0.2.h,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              viewportFraction: 0.8,
                            )),
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
                        // Padding(
                        //   padding: const EdgeInsets.all(15.0),
                        //   child: Container(
                        //       color: white,
                        //       height: MediaQuery.of(context).size.height * 0.5,
                        //       child: ListView.builder(
                        //         physics: BouncingScrollPhysics(),
                        //         scrollDirection: Axis.vertical,
                        //         itemCount: topcom.length,
                        //         itemBuilder: (context, index) =>
                        //             Lawyercard(toplawyerlist: topcom[index]),
                        //       )),
                        // ),
                        
                      ],
                    ),
                  ),
                ),Padding(
                      padding: const EdgeInsets.all(15.0),
                      // child: Container(
                      //     color: white,
                      //     height: MediaQuery.of(context).size.height * 0.5.h,
                          child: ListView.builder(shrinkWrap: true,
          
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: topcom.length,
                            itemBuilder: (context, index) =>
                                Lawyercard(toplawyerlist: topcom[index]),
                          )
                          // ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // categorylist() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.vertical,
  //     child: Categorycardlist()   );
  // }
}
