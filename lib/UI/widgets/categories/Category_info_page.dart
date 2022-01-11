import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/contact_box.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/MainHomePage.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/UI/widgets/categories/Category_form.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Catesider extends StatefulWidget {
  const Catesider({
    Key? key,
    required this.categorytitle,
    required this.categorysubtitle,
    required this.categorypageimages,
    required this.r1,
    required this.r2,
    required this.r3,
    required this.r4,
    required this.r5,
    required this.r6,
  }) : super(key: key);

  // final String Paralegaltitle;
  final String categorytitle,
      categorysubtitle,
      categorypageimages,
      r1,
      r2,
      r3,
      r4,
      r5,
      r6;

  @override
  _CatesiderState createState() => _CatesiderState();
}

class _CatesiderState extends State<Catesider> {

    void onback() {
    Navigator.pushNamed(context, homeroute);
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
          backgroundColor: white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          child: IconButton(
                              iconSize: 40,
                              color: white,
                              icon: Image.asset(
                                "assets/icons/rback.png",
                                color: iconcolor,
                                height: 40,
                              ),
                              onPressed: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainHomepage()))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70.0),
                        child: Text(
                          widget.categorytitle,
                          style: titletextblack,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),

                  Card(
                    elevation: 4,
                    child: Container(
                      height: 150,
                      width: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.categorypageimages),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  spaced20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: AutoSizeText(
                      widget.categorysubtitle,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          // fontSize: 10.sp,
                          color: black),
                      textAlign: TextAlign.justify,
                      minFontSize: 5.0,
                      maxFontSize: 13.0,
                    ),
                  ),
                  spaced10,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          // color: white,
                          // height:50,
                          // width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Titlecard(title: widget.r1),
                              Titlecard(title: widget.r3),
                              Titlecard(title: widget.r5),
                            ],
                          ),
                        ),
                      ),
                      //  SizedBox(
                      //             width: MediaQuery.of(context).size.width *
                      //                 0.005.w,
                      //           ),
                      Expanded(
                        child: Container(
                          // color: green,
                          // height:50,
                          // width: 180,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Titlecard(title: widget.r2),
                              Titlecard(title: widget.r4),
                              Titlecard(title: widget.r6),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                  TextButton(
                    onPressed: () => showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25))),
                        enableDrag: false,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: Buildformsheet(),
                              ),
                            )),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: white,
                            border: Border.all(color: navy)),
                        height: 50,
                        width: 150,
                        // padding: const EdgeInsets.symmetric(
                        //   vertical: 15.0,
                        //   horizontal: 15.0,
                        // ),
                        child: Center(
                          child: Text(
                            translate!.apply,
                            style: GoogleFonts.poppins(
                                // fontWeight: FontWeight.bold,
                                color: black,
                                fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),

                  Contactbox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // buildformsheet() => 
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
