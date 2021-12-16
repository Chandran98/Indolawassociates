import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/model/form_model.dart';
import 'package:indolawassociates/UI/components/appbar.dart';
import 'package:indolawassociates/UI/components/button.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/MainHomePage.dart';
import 'package:indolawassociates/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

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
  late FormModel _formModel;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _namecontroller = TextEditingController();
  // ignore: unused_field
  final _gendercontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _mobilecontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _servicecontroller = TextEditingController();

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _gendercontroller.dispose();
  //   _emailcontroller.dispose();
  //   _mobilecontroller.dispose();
  //   _servicecontroller.dispose();
  //   _namecontroller.dispose();
  //   _emailcontroller.dispose();
  // }

  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Mainhome()));
  }

  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }

  var gendertry;
  List genderlist = ["Male", "Female", "Others"];
  var category;
  List categorylist = [
    "Property",
    "Family",
    "Criminal",
    "Corporate",
    " Cyber Crime",
    "Civil",
    " Taxation",
    "Labour",
    "Consumer"
  ];
  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: height * 0.02,
                // ),
                CustomAppbar(
                  title: widget.categorytitle,
                  navipage: MainHomepage(),
                  style: GoogleFonts.poppins(
                      fontSize: 25.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Card(
                  elevation: 4,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.18.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.categorypageimages),
                            fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    widget.categorysubtitle,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 12.sp, color: black),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: height * 0.005,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: .0),
                  child: Container(
                    color: white,
                    height: MediaQuery.of(context).size.height * 0.15.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          color: white,
                          height: MediaQuery.of(context).size.height * 0.2.h,
                          width: MediaQuery.of(context).size.width * 0.38.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.check, color: gold),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.02.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.r1,
                                      style: GoogleFonts.mulish(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: black),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check, color: gold),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.02.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.r3,
                                      style: GoogleFonts.mulish(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: black),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check, color: gold),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.02.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.r5,
                                      style: GoogleFonts.mulish(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: black),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: white,
                          width: MediaQuery.of(context).size.width * 0.4.w,
                          height: MediaQuery.of(context).size.height * 0.2.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.check, color: gold),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.02.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.r2,
                                      style: GoogleFonts.mulish(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: black),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check, color: gold),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.02.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.r4,
                                      style: GoogleFonts.mulish(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: black),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: gold,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.02.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.r6,
                                      style: GoogleFonts.mulish(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp,
                                          color: black),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                CustomButton(
                  style: GoogleFonts.poppins(
                      // fontWeight: FontWeight.bold,
                      color: black,
                      fontSize: 15.sp),
                  height: height * 0.06,
                  text: translate!.apply,
                  width: width * 0.4,
                  onpressed: () => showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25))),
                      enableDrag: false,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: buildformsheet(),
                            ),
                          )),
                ),
                SizedBox(
                  height: height * 0.001,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(
                    color: divcolor,
                  ),
                ),
                SizedBox(
                  height: height * 0.001,
                ),
                Text(
                  translate.drawerkey5,
                  style: GoogleFonts.poppins(
                      // fontWeight: FontWeight.bold,
                      color: black,
                      fontSize: 12.sp),
                ),
                SizedBox(
                  height: height * 0.001,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        launcher("tel: 8940383000");
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: white,
                              border: Border.all(color: navy)),
                          height: height * 0.06,
                          width: width * 0.35,
                          // padding: const EdgeInsets.symmetric(
                          //   vertical: 15.0,
                          //   horizontal: 15.0,
                          // ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/icons/call.png",
                                  color: black,
                                  height: 20.h,
                                ),
                                Text(
    translate.mobile,                                style: GoogleFonts.poppins(
                                      // fontWeight: FontWeight.bold,
                                      color: black,
                                      fontSize: 12.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )),
                    ),
          
                    TextButton(
                      onPressed: () {
                        launcher("mailto: indolawassociates@gmail.com");
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: white,
                              border: Border.all(color: navy)),
                          height: height * 0.06,
                          width: width * 0.35,
                          // padding: const EdgeInsets.symmetric(
                          //   vertical: 15.0,
                          //   horizontal: 15.0,
                          // ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FaIcon(
                                  (FontAwesomeIcons.mailBulk),
                                  color: black,
                                ),
                                Text(
    translate.mail,                                style: GoogleFonts.poppins(
                                      // fontWeight: FontWeight.bold,
                                      color: black,
                                      fontSize: 12.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )),
                    ),
          
                    //   , CustomButton(
                    // height: height * 0.06,
                    //     text: "Email us",
                    //     width: width*0.35,
                    //     onpressed: (){},
                    //     style: GoogleFonts.poppins(
                    //   // fontWeight: FontWeight.bold,
                    //   color: black,
                    //   fontSize: 12.sp),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget buildformsheet() => SingleChildScrollView(
        //       child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text(
                        "Fill The Form",
                        style: GoogleFonts.mulish(
                            color: navy,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02.h),
                    TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: usernamenull),
                        ]),
                        controller: _namecontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            prefixIcon: Icon(
                              Icons.person,
                              color: navy,
                            ),
                            labelText: "Name",
                            labelStyle: TextStyle(
                                color: navy, fontWeight: FontWeight.bold))),
                    SizedBox(height: 20),
                    TextFormField(
                        controller: _emailcontroller,
                        validator: MultiValidator([
                          RequiredValidator(errorText: emailnull),
                          PatternValidator(
                              (r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
                              errorText: invalidemail)
                        ]),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: navy,
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(
                                color: navy, fontWeight: FontWeight.bold))),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(5),
                      child: DropdownButton(
                        underline: SizedBox(),
                        iconSize: 35,
                        iconEnabledColor: navy,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        hint: Text(
                          "Gender",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: navy,
                              fontWeight: FontWeight.bold),
                        ),
                        items: genderlist.map((valueitem) {
                          return DropdownMenuItem(
                            value: valueitem,
                            child: Text(valueitem),
                          );
                        }).toList(),
                        onChanged: (selected) {
                          setState(() {
                            gendertry = selected;
                          });
                        },
                        value: gendertry,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                        controller: _mobilecontroller,
                        keyboardType: TextInputType.numberWithOptions(),
                        validator: MultiValidator([
                          MaxLengthValidator(10, errorText: phonenummax),
                          MinLengthValidator(10, errorText: phonenummin)
                        ]),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            prefixIcon: Icon(
                              Icons.mobile_screen_share,
                              color: navy,
                            ),
                            labelText: "Mobile",
                            labelStyle: TextStyle(
                                color: navy, fontWeight: FontWeight.bold))),
                    SizedBox(height: 20),
                    TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: addressnull),
                        ]),
                        keyboardType: TextInputType.streetAddress,
                        controller: _addresscontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            labelText: "Address",
                            labelStyle: TextStyle(
                                color: navy, fontWeight: FontWeight.bold))),

                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(5),
                      child: DropdownButton(
                        underline: SizedBox(),
                        iconSize: 35,
                        iconEnabledColor: navy,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        hint: Text(
                          "Services",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: navy,
                              fontWeight: FontWeight.bold),
                        ),
                        items: categorylist.map((valueitem) {
                          return DropdownMenuItem(
                            value: valueitem,
                            child: Text(valueitem),
                          );
                        }).toList(),
                        onChanged: (selected) {
                          setState(() {
                            category = selected;
                          });
                        },
                        value: category,
                      ),
                    ),
                    SizedBox(height: 20),
                    // ignore: deprecated_member_use
                    // Container(color: gold,height: MediaQuery.of(context).size.height *0.05,width: MediaQuery.of(context).size.height *0.2,
                    //   child: InkWell(

                    //     // onPressed: () async{if(_formkey.currentState!.validate()){
                    //     //   String name = _namecontroller.text;
                    //     //   String email = _emailcontroller.text;
                    //     //   String address = _addresscontroller.text;
                    //     //   String gender = _gendercontroller.text;
                    //     //   String mobile = _mobilecontroller.text;
                    //     //   String service = _servicecontroller.text;

                    //       // FormModel? forms = await submitdata(
                    //       //     name, gender, email, address, mobile, service);
                    //       // setState(() {
                    //       //   _formModel = forms!;
                    //       // });

                    //     // }},

                    //     child: Text(
                    //       "Submit",
                    //       style: GoogleFonts.mulish(color: Colors.white),
                    //     ),
                    //      onTap: () {  },
                    //   ),

                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .05.h,
                          width: MediaQuery.of(context).size.width * .3.w,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.green,
                            elevation: 7.0,
                            child: TextButton(
                              onPressed: () async {
                                if (_formkey.currentState!.validate()) {
                                  // String name = _namecontroller.text;
                                  // String email = _emailcontroller.text;
                                  // String address = _addresscontroller.text;
                                  // String gender = gendertry;
                                  // String mobile = _mobilecontroller.text;
                                  // String service = category;

                                  // FormModel? forms = await submitdata(name,
                                  //     gender, email, address, mobile, service);
                                  // setState(() {
                                  //   _formModel = forms;

                                  paralegalservicesform();
                                  Navigator.of(context).pop();

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Submitted"),
                                  ));
                                }
                              },
                              child: Center(
                                  child: Text('Submit',
                                      style: TextStyle(
                                          color: white, fontSize: 20))),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .05.h,
                          width: MediaQuery.of(context).size.width * .3.w,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.red,
                            elevation: 7.0,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                  child: Text('Back',
                                      style: TextStyle(
                                          color: white, fontSize: 20))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          //   ),
        ),
      );

  Future<void> paralegalservicesform() async {
    // FirebaseAuth _auth = FirebaseAuth.instance;

    CollectionReference lawyerform =
        FirebaseFirestore.instance.collection("Paralegal forms");
    return lawyerform.add({
      "Name": _namecontroller.text.trim(),
      "Mobile": _mobilecontroller.text.trim(),
      "Email": _emailcontroller.text.trim(),
      "Services": category,
      "Address": _addresscontroller.text.trim(),
      "Gender": gendertry
    }).then((value) => SnackBar(content: Text("Updated")));
  }

}
