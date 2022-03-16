import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/contact_box.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/provider/theme.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/widgets/Lawyers/Lawyer_info_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/UI/widgets/categories/Category_form.dart';
import 'package:provider/provider.dart';

class Categorypagescrend extends StatefulWidget {
  const Categorypagescrend({
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
  State<Categorypagescrend> createState() => _CategorypagescrendState();
}

class _CategorypagescrendState extends State<Categorypagescrend> {
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
    Navigator.pushNamed(context, homeroute);
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
              // title: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     InkWell(
              //         onTap: () {
              //           Navigator.pop(context);
              //         },
              //         child: const Icon(
              //           Icons.arrow_back_ios,
              //           color: Colors.transparent,
              //         )),
              //     Icon(Icons.shopping_cart_checkout)
              //   ],
              // ),
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
                        widget.categorytitle,
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
                widget.categorypageimages,
                fit: BoxFit.cover,
              )),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  spaced20,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 10),
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
                                "Description",
                                style: TextStyle(
                                    color: white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
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
                      widget.categorysubtitle,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: InkWell(
                      onTap: () => showModalBottomSheet(
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
                              // color: white,
                              border: Border.all(color: appcolor)),
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
                                  // color: black,
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
