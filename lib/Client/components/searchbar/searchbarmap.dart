

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';

class SearchBarmap extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.602,
            height: MediaQuery.of(context).size.height * 0.065,
            padding: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20)),
            ),
            child: Center(
              child: TextField(
                decoration: InputDecoration.collapsed(
                    hintText: 'Search for Lawyers',
                    hintStyle: GoogleFonts.mulish(fontSize: 18, color: navy)),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: navy,
                        size: 30,
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
