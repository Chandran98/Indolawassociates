import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/contact_box.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/MainHomePage.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/widgets/Lawyers/Lawyer_info_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LawyerinfoPage extends StatefulWidget {
  final String name,
      specialized,
      description,
      images,
      area1,
      area2,
      area3,
      area4,
      area5,
      area6;

  const LawyerinfoPage(
      {required this.area1,
      required this.area2,
      required this.area3,
      required this.area4,
      required this.area5,
      required this.area6,
      required this.name,
      required this.images,
      required this.specialized,
      required this.description});

  @override
  State<LawyerinfoPage> createState() => _LawyerinfoPageState();
}

class _LawyerinfoPageState extends State<LawyerinfoPage> {
  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainHomepage()));
  }

  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }

  var whatsapp = "+91 8940383000";

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
          appBar: AppBar(toolbarHeight: 70,
            title: Text(
              "Lawyer info",
              style: titletextwhite,
            ),
            centerTitle: true,
            backgroundColor: dialog,
            automaticallyImplyLeading: false,
            leading: new IconButton(
              icon: Image.asset(
                "assets/icons/rback.png",
                color: white,
                height: 35,
              ),
              onPressed: () => Navigator.pushNamed(context, homeroute),
            ),
            elevation: 0,
            // actions: [Icon(Icons.notifications_active)],
          ),
          body: ListView(
            primary: true,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    color: dialog.withOpacity(0.1),
                    height: 150,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(bottom: 50),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          spaced10,
                          Text(
                            widget.name,
                            style: titletextblack,
                            textAlign: TextAlign.center,
                          ),
                          // SizedBox(
                          //   height: height * 0.001.h,
                          // ),
                          Text(
                            "${widget.specialized} Lawyer",
                            style: demofont,
                          ),
                          spaced20,
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      // color: dialog,
                      border: Border.all(color: white, width: 4),
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      boxShadow: [
                        BoxShadow(
                            color: dialog.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5)),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(widget.images),
                              fit: BoxFit.cover,
                            ),
                            color: white),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: EdgeInsets.all(20),
                // decoration: BoxDecoration(
                //   color: white,
                //   borderRadius: BorderRadius.all(Radius.circular(14)),
                //   boxShadow: [
                //     BoxShadow(
                //         color: dialog.withOpacity(0.1),
                //         blurRadius: 10,
                //         offset: Offset(0, 5)),
                //   ],
                // ),
                child: Column(
                  children: [
                    spaced20,
                    AutoSizeText(
                      widget.description,
                      style: GoogleFonts.poppins(
                        // fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.justify,
                      textScaleFactor: 1,
                    ),
                    spaced10,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Pratices Area", style: demofont),
                    ),
                    spaced10,
                    Row(
                      children: [
                        Expanded(
                            // flex: 1,
                            child: Container(
                          // color: navy,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Titlecard(title: widget.area1),
                              Titlecard(title: widget.area2),
                              Titlecard(title: widget.area3),
                              // Titlecard(title: "title"),
                              // Titlecard(title: "title"),
                            ],
                          ),
                        )),
                        Expanded(
                            // flex: 1,
                            child: Container(
                          // color: green,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Titlecard(title: widget.area4),
                              Titlecard(title: widget.area5),
                              Titlecard(title: widget.area6),
                              // Titlecard(title: "title"),
                              // Titlecard(title: "title"),
                            ],
                          ),
                        ))
                      ],
                    ),
                    Contactbox()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Titlecard extends StatelessWidget {
  Titlecard({required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Icon(Icons.check, color: gold),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 13, color: black),
            ),
          ),
        ],
      ),
    );
  }
}

// class AccountLinkWidget extends StatelessWidget {
//   final Icon icon;
//   final Widget text;
//   final ValueChanged<void> onTap;

//   AccountLinkWidget(
//       {required this.icon, required this.text, required this.onTap, required});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         onTap('');
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 15),
//         child: Row(
//           children: [
//             icon,
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 12),
//               width: 1,
//               height: 24,
//               color: dialog.withOpacity(0.4),
//             ),
//             Expanded(
//               child: text,
//             ),
//             Icon(
//               Icons.arrow_forward_ios,
//               size: 12,
//               color: dialog,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
