import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Categories.dart/cate.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import '../../model/categories_data_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//////////////////////////   Categorycardlist   /////////////////////////////////////////

class Categorycardlist extends StatefulWidget {
  @override
  _CategorycardlistState createState() => _CategorycardlistState();
}

class _CategorycardlistState extends State<Categorycardlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.085.h,
        child: categories(context));
  }

  Widget categories(context) {
    final translate = AppLocalizations.of(context);
    final List<Categorylist> categorylist = [
      Categorylist(
          categorytitle: translate!.categorytitle1,
          categorypic: "assets/icons/property.png",
          categorysubtitle:
           translate.categorysubtitle1,          categorypageimages: 'assets/images/property_cate.jpg',
          r1: "Landlord",
          r2: "Property",
          r3: "Registration",
          r4: "Damaged Property",
          r5: "Legal notice",
          r6: ''),
      Categorylist(
          categorytitle: translate.categorytitle2,
          categorypic: "assets/icons/family.png",
          categorysubtitle:
            translate.categorysubtitle2,   categorypageimages: 'assets/images/div_cate.jpg',
          r1: "Cheating",
          r2: "Addiction",
          r3: "Divorce",
          r4: "Money problem",
          r5: "Non-Tolerable",
          r6: ''),
      Categorylist(
          categorytitle: translate.categorytitle3,
          categorypic: "assets/icons/criminal.png",
          categorysubtitle:
              translate.categorysubtitle3,categorypageimages: 'assets/images/cir_cate.jpg',
          r1: "Assault",
          r2: "Arson",
          r3: "Child Abuse",
          r4: "Rape",
          r5: "Robbery",
          r6: 'Kidnapping'),
      Categorylist(
          categorytitle: translate.categorytitle4,
          categorypic: "assets/icons/coporate.png",
          categorysubtitle:
           translate.categorysubtitle4,categorypageimages: 'assets/images/cor_cate.jpg',
          r1: "Trademark",
          r2: "Cheque Bounce",
          r3: "Arbitration",
          r4: "Copyrights",
          r5: "Start-up",
          r6: 'GST'),
      Categorylist(
          categorytitle: translate.categorytitle5,
          categorypic: "assets/icons/cyber.png",
          categorysubtitle:
         translate.categorysubtitle5,          categorypageimages: 'assets/images/cyber_cate.jpg',
          r1: "Fraud",
          r2: "Harassment",
          r3: "Defamation",
          r4: "Stalking",
          r5: "Freedom of  speech",
          r6: 'Data Breach'),
      Categorylist(
          categorytitle: translate.categorytitle6,
          categorypic: "assets/icons/civilrights.png",
          categorysubtitle:
         translate.categorysubtitle6,    categorypageimages: 'assets/images/civil_cate.jpg',
          r1: "Contracts",
          r2: "Property",
          r3: "Family relations",
          r4: "Trot",
          r5: "Legal remedy",
          r6: ''),
      Categorylist(
          categorytitle: translate.categorytitle7,
          categorypic: "assets/icons/tax.png",
          categorysubtitle:
      translate.categorysubtitle7,    categorypageimages: 'assets/images/Tax_cate.jpg',
          r1: "Firms",
          r2: "Companies",
          r3: "Associations",
          r4: "Tax Individuals",
          r5: "Asset Management",
          r6: ''),
      Categorylist(
          categorytitle: translate.categorytitle8,
          categorypic: "assets/icons/labour.png",
          categorysubtitle:
              translate.categorysubtitle8,categorypageimages: 'assets/images/cor_cate.jpg',
          r1: "Legal guidance",
          r2: "Trade unions",
          r3: "Negotiations",
          r4: "Employee entities",
          r5: "Industrial relation",
          r6: 'Element of labour'),
      Categorylist(
          categorytitle: translate.categorytitle9,
          categorypic: "assets/icons/consumer.png",
          categorysubtitle:
         translate.categorysubtitle9, categorypageimages: 'assets/images/con_cate.jpg',
          r1: "Marketing goods",
          r2: "Unfair trade",
          r3: "Consumer education",
          r4: "Defective",
          r5: "Over-Margin",
          r6: 'Hazardous to life'),
    ];

    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categorylist.length,
        itemBuilder: (context, index) {
          return Categorycard(
            r1: categorylist[index].r1,
            r2: categorylist[index].r2,
            r3: categorylist[index].r3,
            r4: categorylist[index].r4,
            r5: categorylist[index].r5,
            r6: categorylist[index].r6,
            categorysubtitle: categorylist[index].categorysubtitle,
            categorypageimages: categorylist[index].categorypageimages,
            categorytitle: categorylist[index].categorytitle,
            categorypic: categorylist[index].categorypic,
          );
        });
  }
}

//////////////////////////   Categorycard   /////////////////////////////////////////
class Categorycard extends StatelessWidget {
  const Categorycard(
      {Key? key,
      required this.categorytitle,
      required this.categorypageimages,
      required this.categorypic,
      required this.categorysubtitle,
      required this.r1,
      required this.r2,
      required this.r3,
      required this.r4,
      required this.r5,
      required this.r6})
      : super(key: key);

  final String categorytitle;
  final String categorypageimages;
  final String r1, r2, r3, r4, r5, r6;
  final String categorypic;
  final String categorysubtitle;

  @override
  Widget build(BuildContext context) {
    // final translate = AppLocalizations.of(context);

    return InkWell(
      onTap: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Catepage(
                    r1: r1,
                    r6: r6,
                    categorytitle: categorytitle,
                    categorypageimages: categorypageimages,
                    categorysubtitle: categorysubtitle,
                    r2: r2,
                    r3: r3,
                    r4: r4,
                    r5: r5,
                  )
              // Categorypagedetails(categorytitle: categorytitle)
              )),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          height: MediaQuery.of(context).size.height * 0.08.h,
          width: MediaQuery.of(context).size.width * .23.w,
          child: Column(
            children: [
              ClipOval(
                child: Container(
                  width: MediaQuery.of(context).size.height * 0.05.w,
                  height: MediaQuery.of(context).size.height * 0.04.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      image: DecorationImage(
                          image: AssetImage(
                            categorypic,
                          ),
                          fit: BoxFit.contain)),
                ),
              ),
              Container(margin: EdgeInsets.all(5),
                  child: FittedBox(
                    child: Text(categorytitle,
                        style: GoogleFonts.mulish(
                            fontSize:13 .sp,
                            fontWeight: FontWeight.w600,
                            color: navy)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////// CategoryPage Details///////////////////////////

