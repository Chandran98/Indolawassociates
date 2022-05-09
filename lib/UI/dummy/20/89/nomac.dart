import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/search_bar.dart';
import 'package:indolawassociates/UI/components/slider/slider.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/dummy/20/homwe.dart';
import 'package:indolawassociates/UI/pages/Home_page.dart';
import 'package:indolawassociates/UI/widgets/Lawyers/Lawyer_list.dart';
import 'package:provider/provider.dart';

import '../../../provider/theme.dart';

// #F2DDCB
class NOmac extends StatelessWidget {
  const NOmac({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Homepageappbar(),
                Searchbar(),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "Category",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                // Row(
                //   children: [
                //     Cateclass(),
                //     Cateclass(),
                //     Cateclass(),
                //   ],
                // ),
                // Row(
                //   children: [
                //     Cateclass(),
                //     Cateclass(),
                //     Cateclass(),
                //   ],
                // ),
                // Row(
                //   children: [
                //     Cateclass(),
                //     Cateclass(),
                //   ],
                // )

                // Ledacy(),
                // GRidtitlelist(),
                // spaced20,
                
                Bannerslider(),
                Toplawyers(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Cateclass extends StatelessWidget {
  final String text;
   Cateclass({required this.text}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 50,
        width: 110,
        child: Center(child: Text(text)),
        decoration: BoxDecoration(
                    border: Border.all(color: appcolor, width: 0.5),
                    // borderRadius: BorderRadius.circular(40)
          borderRadius: BorderRadius.circular(30),
          color: context.watch<Themeprovider>().darktheme
              ? Colors.black54
              : white,
        ),
      ),
    );
  }
}
