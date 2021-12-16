import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/UI/pages/Redesign.dart';
import 'package:indolawassociates/UI/pages/profilepage.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/pages/MainHomePage.dart';
import 'package:intl/intl.dart';
import '../../main.dart';

class Careerspage extends StatefulWidget {
  Careerspage({Key? key}) : super(key: key);

  @override
  _CareerspageState createState() => _CareerspageState();
}

class _CareerspageState extends State<Careerspage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  var careersopt;
  List careersoptlist = ["Yes", "No"];

  final _namecontroller = TextEditingController();
  final _employeeidcontroller = TextEditingController();
  final _specializationcontroller = TextEditingController();
  final _mobilecontroller = TextEditingController();
  final _experiencecontroller = TextEditingController();
  final _preferedareacontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _contactaddresscontroller = TextEditingController();
  final _dobcontroller = TextEditingController();

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    _namecontroller.dispose();
    _employeeidcontroller.dispose();
    _specializationcontroller.dispose();
    _mobilecontroller.dispose();
    _experiencecontroller.dispose();
    _preferedareacontroller.dispose();
    _addresscontroller.dispose();
    _contactaddresscontroller.dispose();
    _dobcontroller.dispose();
  }

  void onback() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final translate = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Container(
                          child: IconButton(
                              iconSize: 40.r,
                              color: white,
                              icon: Image.asset(
                                "assets/icons/rback.png",
                                color: iconcolor,
                                height: 40.h,
                              ),
                              onPressed: () =>
                                  Navigator.pushNamed(context, settingsroute)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
                        child: Text(
                          translate!.drawerkey7,
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                            image: AssetImage("assets/images/COD.jpg"),
                            fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    height: height * 0.035.h,
                  ),
                  Text(
                    translate.career4,
                    style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: height * 0.015.h,
                  ),
                  Text(
                    translate.career5, textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    // textScaleFactor: 1,
                  ),
                  SizedBox(
                    height: height * 0.01.h,
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
                                child: buildformsheet(),
                              ),
                            )),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: white,
                            border: Border.all(color: navy)),
                        height: MediaQuery.of(context).size.height * 0.05.h,
                        width: MediaQuery.of(context).size.width * 0.4.w,
                        // padding: const EdgeInsets.symmetric(
                        //   vertical: 15.0,
                        //   horizontal: 15.0,
                        // ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              translate.career1,
                              style: GoogleFonts.poppins(
                                  // fontWeight: FontWeight.bold,
                                  color: black,
                                  fontSize: 17.sp),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                  )
                ],
              ),
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
                    // TextField(
                    //     controller: _dobcontroller,
                    //     // validator: MultiValidator([
                    //     //   RequiredValidator(errorText: DOB)
                    //     //   // MaxLengthValidator(10, errorText: phonenummax),
                    //     //   // MinLengthValidator(10, errorText: phonenummin)
                    //     // ]),
                    //     decoration: InputDecoration(
                    //         border: OutlineInputBorder(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(20))),
                    //         prefixIcon: Icon(
                    //           Icons.mobile_screen_share,
                    //           color: navy,
                    //         ),
                    //         labelText: "Date Of Birth",
                    //         labelStyle: TextStyle(
                    //             color: navy, fontWeight: FontWeight.bold))),

                    TextFormField(
                      controller: _dobcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: navy,
                          ),
                          labelText: "Date of Birth",
                          labelStyle: TextStyle(
                              color: navy, fontWeight: FontWeight.bold)),
                      onTap: () async {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            _dobcontroller.text =
                                DateFormat('dd-MM-yyyy').format(selectedDate);
                            print(_dobcontroller.text);
                          }
                        });
                        // var dob = DateFormat("dd-MM-yyyy");
                        // // DateTime date = DateTime(1900);
                        // FocusScope.of(context).requestFocus(new FocusNode());

                        // final _picked = await showDatePicker(
                        //     context: context,
                        //     initialDate: DateTime.now(),
                        //     firstDate: DateTime(1900),
                        //     lastDate: DateTime(2100));

                        // _dobcontroller.text = DateFormat("dd-MM-yyyy").format(_picked);
                        // print(_picked);
                      },
                    ),

                    SizedBox(height: 20),
                    TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: employeeid),
                        ]),
                        controller: _employeeidcontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            labelText: "Enrollment ID",
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
                    TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: addressnull),
                        ]),
                        keyboardType: TextInputType.streetAddress,
                        controller: _contactaddresscontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            labelText: "Contact Address",
                            labelStyle: TextStyle(
                                color: navy, fontWeight: FontWeight.bold))),
                    SizedBox(height: 20),
                    TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: specialization),
                        ]),
                        controller: _specializationcontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            labelText: "Specialization",
                            labelStyle: TextStyle(
                                color: navy, fontWeight: FontWeight.bold))),
                    SizedBox(height: 20),
                    TextFormField(
                        controller: _experiencecontroller,
                        keyboardType: TextInputType.numberWithOptions(),
                        validator: MultiValidator([
                          RequiredValidator(errorText: experience),
                          MaxLengthValidator(2, errorText: experiencenull),
                          MinLengthValidator(1, errorText: experiencenull)
                        ]),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            labelText: "Experience",
                            labelStyle: TextStyle(
                                color: navy, fontWeight: FontWeight.bold))),
                    SizedBox(height: 20),
                    TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: preferedarea),
                        ]),
                        controller: _preferedareacontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            labelText: "Prefered Area",
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
                          "Okay To Associate",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: navy,
                              fontWeight: FontWeight.bold),
                        ),
                        items: careersoptlist.map((valueitem) {
                          return DropdownMenuItem(
                            value: valueitem,
                            child: Text(valueitem),
                          );
                        }).toList(),
                        onChanged: (selected) {
                          setState(() {
                            careersopt = selected;
                          });
                        },
                        value: careersopt,
                      ),
                    ),
                    SizedBox(height: 20),
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
                                  joiningform();
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
  Future<void> joiningform() async {
    // FirebaseAuth _auth = FirebaseAuth.instance;

    CollectionReference lawyerform =
        FirebaseFirestore.instance.collection("Lawyer forms");
    return lawyerform.add({
      "Name": _namecontroller.text.trim(),
      "Mobile": _mobilecontroller.text.trim(),
      "DOB": _dobcontroller.text.trim(),
      "Emloyee ID": _employeeidcontroller.text.trim(),
      "Address": _addresscontroller.text.trim(),
      "Contact Address": _contactaddresscontroller.text.trim(),
      "Specialization": _specializationcontroller.text.trim(),
      "Experience": _experiencecontroller.text.trim(),
      "prefered Area": _preferedareacontroller.text.trim(),
      "Okay to Associaate": careersopt
    }).then((value) => SnackBar(content: Text("Updated")));
  }
}
