import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:indolawassociates/Client/Pages/Categories.dart/Categories_Pages.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/model/categories_data_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Democard extends StatefulWidget {
  Democard({Key? key}) : super(key: key);

  @override
  _DemocardState createState() => _DemocardState();
}

class _DemocardState extends State<Democard> {

  @override
  Widget build(BuildContext context) {
    return categories(context);
  }
    Widget categories(context) {
    final translate = AppLocalizations.of(context);
    final List<Categorylist> categorylist = [
      Categorylist(
          categorytitle: translate!.categorytitle1,
          categorypic: "assets/icons/property.png",
          categorysubtitle: translate.categorysubtitle1,
          categorypageimages: 'assets/images/property_cate.jpg',
          r1: translate.propertykey1,
          r2: translate.propertykey2,
          r3: translate.propertykey3,
          r4: translate.propertykey4,
          r5: translate.propertykey5,
          r6: ''),
      Categorylist(
          categorytitle: translate.categorytitle2,
          categorypic: "assets/icons/family.png",
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
          categorypic: "assets/icons/criminal.png",
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
          categorypic: "assets/icons/coporate.png",
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
          categorypic: "assets/icons/cyber.png",
          categorysubtitle: translate.categorysubtitle5,
          categorypageimages: 'assets/images/cyber_cate.jpg',
          r1: translate.cyberkey1,
          r2: translate.cyberkey2,
          r3: translate.cyberkey3,
          r4: translate.cyberkey4,
          r5: translate.cyberkey5,
          r6: translate.cyberkey6),
      Categorylist(
          categorytitle: translate.categorytitle6,
          categorypic: "assets/icons/civilrights.png",
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
          categorypic: "assets/icons/tax.png",
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
          categorypic: "assets/icons/labour.png",
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

    return ListView.separated( separatorBuilder: (context,index){return SizedBox(height: 15,);}, 
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categorylist.length,
        itemBuilder: (context, index) {
          return Column(
          children: [
            ClipOval(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.1.w,
                height: MediaQuery.of(context).size.height * 0.05.h,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    image: DecorationImage(
                        image: AssetImage(
                          categorylist[index].categorypic,
                        ),
                        fit: BoxFit.contain)),
              ),
            ),
            Container(
                margin: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text(categorylist[index].categorytitle,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: navy)),
                ))
          ],
        );
    
  
        });
  }
}
