import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Homepage/drawer.dart';
import 'package:indolawassociates/Client/Pages/darwerlist.dart/careers/careersmodel.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/model/form_model.dart';
import 'package:http/http.dart' as http;

class Careers extends StatefulWidget {
  const Careers({Key? key}) : super(key: key);

  @override
  _CareersState createState() => _CareersState();
}

class _CareersState extends State<Careers> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late Careersmodel _careersmodel;

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

  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Maindrawer()));
  }

  DateTime _datetime = DateTime.now();

  Future<Null> selectTimePicker(context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _datetime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2500));

    if (picked != null && picked != _datetime) {
      setState(() {
        _datetime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: gold,
          onPressed: () => showModalBottomSheet(
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
          label: Text(
            "Join Us Now",
          ),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: Text(
            "Careers",
            style: GoogleFonts.mulish(
                color: navy, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Maindrawer())),
              icon: Icon(
                Icons.arrow_back,
                color: navy,
              )),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/COD.jpg"),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.h,
                  height: MediaQuery.of(context).size.height * 0.56.h,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: Column(
                        children: [
                          Text(
                            "Lawyer ",
                            style: bStyle,
                            textScaleFactor: 1,
                          ),
                          // Text("Experience ${toplawyerlist.Experience}",style: hStyle,),
                          // Text(
                          //   "toplawyerlist.type",
                          //     style: GoogleFonts.mulish(
                          //         fontWeight: FontWeight.w600,
                          //         fontSize: 16,
                          //         color: navy)),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.015.h,
                          ),
                          Text(
                            "Chennai, Tamilnadu",
                            style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                color: navy),
                            textAlign: TextAlign.justify,
                            textScaleFactor: 1,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 190.0),
                            child: Text(
                              "Job Description",
                              style: GoogleFonts.mulish(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  color: gold),
                              textAlign: TextAlign.start,
                              textScaleFactor: 1,
                            ),
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.015.h,
                          ),
                          Text(
                            "     At the heart of every great change is a great human. Every day our People of Change are doing incredible things by working together to pursue our shared purpose–to deliver on the promise of technology and human ingenuity.Come be part of our team–bring your ideas, ingenuity and determination to make a difference, and we’ll solve some of the world’s biggest challenges. Choose a career with us, and together, let's create positive, long-lasting value.",
                            style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: navy),
                            textAlign: TextAlign.justify,
                            textScaleFactor: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
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
                    // TextFormField(
                    //     controller: _dobcontroller,
                    //     validator: MultiValidator([
                    //       RequiredValidator(errorText: DOB)
                    //       // MaxLengthValidator(10, errorText: phonenummax),
                    //       // MinLengthValidator(10, errorText: phonenummin)
                    //     ]),
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(5),
                      child: FlatButton(
                          onPressed: () {
                            selectTimePicker(context);
                          },
                          child: Row(
                            children: [Text(_datetime.toString())],
                          )),
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
                            labelText: "Employee ID",
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
                                  String name = _namecontroller.text;
                                  String permenantAddress =
                                      _addresscontroller.text;
                                  String mobileNo = _mobilecontroller.text;
                                  // String dateOfBirth = _dobcontroller.text;
                                  DateTime dateOfBirth = _datetime;

                                  String employeeId =
                                      _employeeidcontroller.text;
                                  String contactAddress =
                                      _contactaddresscontroller.text;
                                  String prefferedArea =
                                      _preferedareacontroller.text;
                                  String okayToAssociate = careersopt;

                                  Careersmodel formsd = await submitdata(
                                      dateOfBirth,
                                      name,
                                      employeeId,
                                      contactAddress,
                                      specialization,
                                      experience,
                                      prefferedArea,
                                      permenantAddress,
                                      mobileNo,
                                      okayToAssociate);
                                  setState(() {
                                    _careersmodel = formsd;
                                    Navigator.of(context).pop();

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text("Submitted"),
                                    ));
                                  });
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
}

Future<Careersmodel> submitdata(
  DateTime dateOfBirth,
  String name,
  employeeId,
  contactAddress,
  specialization,
  experience,
  prefferedArea,
  permenantAddress,
  mobileNo,
  okayToAssociate,
) async {
  final response = await http
      .post(Uri.parse("http://api.indolawassociates.com/api/join"), body: {
    "name": name,
    "date_of_birth": dateOfBirth,
    "employee_id": employeeId,
    "permenant_address": permenantAddress,
    "contact_address": contactAddress,
    "mobile_no": mobileNo,
    "specialization": specialization,
    "experience": experience,
    "okay_to_associate": okayToAssociate,
    "preffered_area": prefferedArea,
  });
  var data = response.body.toString();
  var _data = jsonDecode(data);
  return careersmodelFromJson(_data);

  // if (response.statusCode == 201) {
  //   final  data = response.body;
  //   return formModelFromJson(data);
  // } else {
  //   return null;
  // }
}
