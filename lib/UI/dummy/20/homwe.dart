import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/Title_card.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/dummy/20/89/nomac.dart';
import 'package:indolawassociates/UI/models/categories_data_model.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/UI/provider/theme.dart';
import 'package:indolawassociates/UI/widgets/categories/Category_info_page.dart';
import 'package:provider/provider.dart';

class GRidtitlelist extends StatefulWidget {
  GRidtitlelist({Key? key}) : super(key: key);

  @override
  State<GRidtitlelist> createState() => _GRidtitlelistState();
}

class _GRidtitlelistState extends State<GRidtitlelist> {
  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    final List<Categorylist> categorylist = [
      Categorylist(
          categorytitle: translate!.categorytitle2,
          categorypic: "assets/icons/1family.png",
          categorysubtitle: translate.categorysubtitle2,
          categorypageimages: 'assets/images/div_cate.jpg',
          r1: translate.familykey1,
          r2: translate.familykey2,
          r3: translate.familykey3,
          r4: translate.familykey4,
          r5: translate.familykey5,
          r6: ''),
      Categorylist(
          categorytitle: translate.categorytitle3,
          categorypic: "assets/icons/1Criminal.png",
          categorysubtitle: translate.categorysubtitle3,
          categorypageimages: 'assets/images/cir_cate.jpg',
          r1: translate.criminalkey1,
          r2: translate.criminalkey2,
          r3: translate.criminalkey3,
          r4: translate.criminalkey4,
          r5: translate.criminalkey5,
          r6: translate.criminalkey6),
      Categorylist(
          categorytitle: translate.categorytitle4,
          categorypic: "assets/icons/1Corporate1.png",
          categorysubtitle: translate.categorysubtitle4,
          categorypageimages: 'assets/images/cor_cate.jpg',
          r1: translate.corporatekey1,
          r2: translate.corporatekey2,
          r3: translate.corporatekey3,
          r4: translate.corporatekey4,
          r5: translate.corporatekey5,
          r6: translate.corporatekey6),
      Categorylist(
          categorytitle: translate.categorytitle5,
          categorypic: "assets/icons/1cyber.png",
          categorysubtitle: translate.categorysubtitle5,
          categorypageimages: 'assets/images/cyber_cate.jpg',
          r1: translate.cyberkey1,
          r2: translate.cyberkey2,
          r3: translate.cyberkey3,
          r4: translate.cyberkey4,
          r5: translate.cyberkey5,
          r6: translate.cyberkey6),
      Categorylist(
          categorytitle: translate.categorytitle1,
          categorypic: "assets/icons/1property.png",
          categorysubtitle: translate.categorysubtitle1,
          categorypageimages: 'assets/images/property_cate.jpg',
          r1: translate.propertykey1,
          r2: translate.propertykey2,
          r3: translate.propertykey3,
          r4: translate.propertykey4,
          r5: translate.propertykey5,
          r6: ''),
      Categorylist(
          categorytitle: translate.categorytitle6,
          categorypic: "assets/icons/1Civilrights.png",
          categorysubtitle: translate.categorysubtitle6,
          categorypageimages: 'assets/images/civil_cate.jpg',
          r1: translate.civilkey1,
          r2: translate.civilkey2,
          r3: translate.civilkey3,
          r4: translate.civilkey4,
          r5: translate.civilkey5,
          r6: ''),
      Categorylist(
          categorytitle: translate.categorytitle7,
          categorypic: "assets/icons/1Tax1.png",
          categorysubtitle: translate.categorysubtitle7,
          categorypageimages: 'assets/images/Tax_cate.jpg',
          r1: translate.taxkey1,
          r2: translate.taxkey2,
          r3: translate.taxkey3,
          r4: translate.taxkey4,
          r5: translate.taxkey5,
          r6: ''),
      Categorylist(
          categorytitle: translate.categorytitle8,
          categorypic: "assets/icons/1Labour.png",
          categorysubtitle: translate.categorysubtitle8,
          categorypageimages: 'assets/images/cor_cate.jpg',
          r1: translate.labourkey1,
          r2: translate.labourkey2,
          r3: translate.labourkey3,
          r4: translate.labourkey4,
          r5: translate.labourkey5,
          r6: translate.labourkey6),
      Categorylist(
          categorytitle: translate.categorytitle9,
          categorypic: "assets/icons/consumer.png",
          categorysubtitle: translate.categorysubtitle9,
          categorypageimages: 'assets/images/con_cate.jpg',
          r1: translate.consumerkey1,
          r2: translate.consumerkey2,
          r3: translate.consumerkey3,
          r4: translate.consumerkey4,
          r5: translate.consumerkey5,
          r6: translate.consumerkey6),
    ];

    return Column(
      children: [
        Rowtitle(
          title: translate.categories,
        ),
        spaced20,
        Card(
          child: Container(
            height: 360,
            color: Colors.white,
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1),
              itemCount: categorylist.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          
                            builder: (context) => Categorypagescrend(
                                  r1: categorylist[index].r1,
                                  r2: categorylist[index].r2,
                                  r3: categorylist[index].r3,
                                  r4: categorylist[index].r4,
                                  r5: categorylist[index].r5,
                                  r6: categorylist[index].r6,
                                  categorysubtitle:
                                      categorylist[index].categorysubtitle,
                                  categorypageimages:
                                      categorylist[index].categorypageimages,
                                  categorytitle:
                                      categorylist[index].categorytitle,
                                )));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Container(
                        width: 80,
                        padding: EdgeInsets.symmetric(horizontal: 10),

                        // height: height * 0.18.h,
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // color: Colors.grey.shade300,
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                        categorylist[index].categorypic,
                                      ))),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                child: FittedBox(
                              child: Text(categorylist[index].categorytitle,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        spaced30,
      ],
    );
  }
}

/////////////////

class Ledacy extends StatefulWidget {
  const Ledacy({Key? key}) : super(key: key);

  @override
  State<Ledacy> createState() => _LedacyState();
}

class _LedacyState extends State<Ledacy> {
  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    final List<Categorylist> categorylist = [
      Categorylist(
          categorytitle: translate!.categorytitle2,
          categorypic: "assets/icons/1family.png",
          categorysubtitle: translate.categorysubtitle2,
          categorypageimages: 'assets/images/div_cate.jpg',
          r1: translate.familykey1,
          r2: translate.familykey2,
          r3: translate.familykey3,
          r4: translate.familykey4,
          r5: translate.familykey5,
          r6: ''),
      Categorylist(
          categorytitle: translate.categorytitle3,
          categorypic: "assets/icons/1Criminal.png",
          categorysubtitle: translate.categorysubtitle3,
          categorypageimages: 'assets/images/cir_cate.jpg',
          r1: translate.criminalkey1,
          r2: translate.criminalkey2,
          r3: translate.criminalkey3,
          r4: translate.criminalkey4,
          r5: translate.criminalkey5,
          r6: translate.criminalkey6),
      Categorylist(
          categorytitle: translate.categorytitle4,
          categorypic: "assets/icons/1Corporate1.png",
          categorysubtitle: translate.categorysubtitle4,
          categorypageimages: 'assets/images/cor_cate.jpg',
          r1: translate.corporatekey1,
          r2: translate.corporatekey2,
          r3: translate.corporatekey3,
          r4: translate.corporatekey4,
          r5: translate.corporatekey5,
          r6: translate.corporatekey6),
      Categorylist(
          categorytitle: translate.categorytitle5,
          categorypic: "assets/icons/1cyber.png",
          categorysubtitle: translate.categorysubtitle5,
          categorypageimages: 'assets/images/cyber_cate.jpg',
          r1: translate.cyberkey1,
          r2: translate.cyberkey2,
          r3: translate.cyberkey3,
          r4: translate.cyberkey4,
          r5: translate.cyberkey5,
          r6: translate.cyberkey6),
      Categorylist(
          categorytitle: translate.categorytitle1,
          categorypic: "assets/icons/1property.png",
          categorysubtitle: translate.categorysubtitle1,
          categorypageimages: 'assets/images/property_cate.jpg',
          r1: translate.propertykey1,
          r2: translate.propertykey2,
          r3: translate.propertykey3,
          r4: translate.propertykey4,
          r5: translate.propertykey5,
          r6: ''),
      Categorylist(
          categorytitle: translate.categorytitle6,
          categorypic: "assets/icons/1Civilrights.png",
          categorysubtitle: translate.categorysubtitle6,
          categorypageimages: 'assets/images/civil_cate.jpg',
          r1: translate.civilkey1,
          r2: translate.civilkey2,
          r3: translate.civilkey3,
          r4: translate.civilkey4,
          r5: translate.civilkey5,
          r6: ''),
      Categorylist(
          categorytitle: translate.categorytitle7,
          categorypic: "assets/icons/1Tax1.png",
          categorysubtitle: translate.categorysubtitle7,
          categorypageimages: 'assets/images/Tax_cate.jpg',
          r1: translate.taxkey1,
          r2: translate.taxkey2,
          r3: translate.taxkey3,
          r4: translate.taxkey4,
          r5: translate.taxkey5,
          r6: ''),
      Categorylist(
          categorytitle: translate.categorytitle8,
          categorypic: "assets/icons/1Labour.png",
          categorysubtitle: translate.categorysubtitle8,
          categorypageimages: 'assets/images/cor_cate.jpg',
          r1: translate.labourkey1,
          r2: translate.labourkey2,
          r3: translate.labourkey3,
          r4: translate.labourkey4,
          r5: translate.labourkey5,
          r6: translate.labourkey6),
      Categorylist(
          categorytitle: translate.categorytitle9,
          categorypic: "assets/icons/consumer.png",
          categorysubtitle: translate.categorysubtitle9,
          categorypageimages: 'assets/images/con_cate.jpg',
          r1: translate.consumerkey1,
          r2: translate.consumerkey2,
          r3: translate.consumerkey3,
          r4: translate.consumerkey4,
          r5: translate.consumerkey5,
          r6: translate.consumerkey6),
    ];

    return Column(
      children: [
        Rowtitle(
          title: translate.categories,
        ),
        spaced20,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 400,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categorylist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Cateclass(text: categorylist[index].categorytitle);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Chocicechipes extends StatelessWidget {
  final String text;
  const Chocicechipes({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:
            context.watch<Themeprovider>().darktheme ? Colors.black54 : white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: EdgeInsets.only(left: 10),
      child: Center(child: Text(text)),
    );
  }
}