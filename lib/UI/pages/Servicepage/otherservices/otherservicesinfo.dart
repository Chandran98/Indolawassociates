import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/contact_box.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/Servicepage/Paralegal/Paralegal_form.dart';
import 'package:indolawassociates/UI/pages/Servicepage/otherservices/Otherservices_form.dart';
import 'package:indolawassociates/UI/provider/theme.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:provider/provider.dart';

class OTherservicesscreen extends StatefulWidget {
  OTherservicesscreen(
      {required this.servicetitle,
      required this.servicecontent,
      required this.serviceimage});
  final String servicetitle, servicecontent, serviceimage;

  @override
  State<OTherservicesscreen> createState() => _OTherservicesscreenState();
}

class _OTherservicesscreenState extends State<OTherservicesscreen> {
  
  
  double rightvalue = 200;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      setState(() {
        rightvalue = 10;
      });
    });
    super.initState();
  }
  
onback() {
    Navigator.pushNamed(context,servicespage);
    // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>n()));
  }
  
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
            body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              pinned: true,
              elevation: 0,
              expandedHeight: 250,
              bottom: PreferredSize(
                  child: Container(
                    height: 80,
                    color: Colors.transparent.withOpacity(0.4),
                    width: double.maxFinite,
                    child: Center(
                      child: Text(
                        widget.servicetitle,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  preferredSize: Size.fromHeight(25)),
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                widget.serviceimage,
                fit: BoxFit.cover,
              )),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                   spaced20, 
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      context.watch<Themeprovider>().darktheme ==
                                              false
                                          ? appcolor
                                          : appcolor2),
                              child: AnimatedPadding(
                                duration: Duration(milliseconds: 1000),
                                padding: EdgeInsets.only(
                                    left: 10,
                                    right: rightvalue,
                                    top: 5,
                                    bottom: 5),
                                child: Text(
                                translate!.description,
                                  style: TextStyle(color: white,
                                      fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                              )),
                          Spacer(),
                          Container()
                        ],
                      ),
                    ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      widget.servicecontent,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400, fontSize: 14
                          // fontSize: 10.sp,
                          ),
                      textAlign: TextAlign.justify,
                      // minFontSize: 5.0,
                      // fonts: 16.0,
                    ),
                  ),
                  spaced10,
    
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: InkWell(
                      onTap: () => showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.vertical(top: Radius.circular(25))),
                          enableDrag: false,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).viewInsets.bottom),
                                  child: Otherservicesform(),
                                ),
                              )),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              // color: white,
                              border: Border.all(color: appcolor)),
                          height: 50,
                          width: 150,
                          child: Center(
                            child: Text(
                              translate.apply,
                              style: GoogleFonts.poppins(
                                  fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ),
                  ),
                  Contactbox(),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
