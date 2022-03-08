
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/constant/constant.dart';

class Rowtitle extends StatelessWidget {
  String title;
  Rowtitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Container(
              height: 30,
              width: 5,
              decoration: BoxDecoration(
                  color: appcolor, borderRadius: BorderRadius.circular(20)),
            ),
            spacedwidth10,
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w500),
            )
          ],
        ),
        Spacer(),
        Text(
          "view all",
          style: GoogleFonts.poppins(
              color: appcolor2,
               fontSize: 15, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
