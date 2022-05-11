import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/services/fireabase_service.dart';
import 'package:intl/intl.dart';
// import 'package:sizer/sizer.dart';
import 'package:path/path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Careersform extends StatefulWidget {
  Careersform({Key? key}) : super(key: key);

  @override
  _CareersformState createState() => _CareersformState();
}

class _CareersformState extends State<Careersform> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool color = false;
  var careersopt;
  var preferedarea;
  List careersoptlist = ["Full Time", "Part Time", "Case Based only"];
  List preferedarealist = [
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

  final _namecontroller = TextEditingController();
  final _employeeidcontroller = TextEditingController();
  final _specializationcontroller = TextEditingController();
  final _mobilecontroller = TextEditingController();
  final _experiencecontroller = TextEditingController();
  // final _preferedareacontroller = TextEditingController();
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
    // _preferedareacontroller.dispose();
    _addresscontroller.dispose();
    _contactaddresscontroller.dispose();
    _dobcontroller.dispose();
  }

  // File? reqfile;

  File? reqfile;
  File? enrollmentid;
  var pickfile;
  var enrollmentfiles;
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    final translate = AppLocalizations.of(context);
    void onback() {
      Navigator.pushNamed(context, settingsroute);
    }

    final fileName =
        reqfile != null ? basename(reqfile!.path) : 'No File Selected';
    return SingleChildScrollView(
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
                      style: GoogleFonts.poppins(
                          color: black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),spaced20,
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
                            color: black,
                          ),
                          labelText: "Name",
                          labelStyle: demofont)),
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
                          labelStyle: demofont)),
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
                        labelStyle: demofont),
                    onTap: () async {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData(
                                primarySwatch: Colors.grey,
                                splashColor: Colors.black,
                                textTheme: TextTheme(
                                  subtitle1: TextStyle(color: Colors.black),
                                  button: TextStyle(color: Colors.black),
                                ),
                                accentColor: Colors.black,
                                colorScheme: ColorScheme.light(
                                    primary: dialog,
                                    primaryVariant: Colors.black,
                                    secondaryVariant: Colors.black,
                                    onSecondary: Colors.black,
                                    onPrimary: Colors.white,
                                    surface: Colors.black,
                                    onSurface: Colors.black,
                                    secondary: Colors.black),
                                dialogBackgroundColor: Colors.white,
                              ),
                              child: child ?? Text(""),
                            );
                          }).then((selectedDate) {
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
                          labelStyle: demofont)),
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
                          labelText: "Temporary Address",
                          labelStyle: demofont)),
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
                          labelText: "Permanent Address",
                          labelStyle: demofont)),
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
                          labelStyle: demofont)),
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
                          labelStyle: demofont)),
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
                      hint: Text("Prefered Area", style: demofont),
                      items: preferedarealist.map((valueitem) {
                        return DropdownMenuItem(
                          value: valueitem,
                          child: Text(valueitem),
                        );
                      }).toList(),
                      onChanged: (selected) {
                        setState(() {
                          preferedarea = selected;
                        });
                        FocusScope.of(context).requestFocus();
                      },
                      value: preferedarea,
                    ),
                  ),
                  // SizedBox(height: 20),
                  // TextFormField(
                  //     validator: MultiValidator([
                  //       RequiredValidator(errorText: preferedarea),
                  //     ]),
                  //     controller: _preferedareacontroller,
                  //     decoration: InputDecoration(
                  //         border: OutlineInputBorder(
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(20))),
                  //         labelText: "Prefered Area",
                  //         labelStyle: TextStyle(
                  //             color: navy, fontWeight: FontWeight.bold))),
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
                      hint: Text("Okay To Associate", style: demofont),
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
    
                  // TextButton(onPressed: selectfile, child: Text("Pick file",style: demofont,)),
                  TextButton(
                    onPressed: () async {
                      pickfile = await FilePicker.platform
                          .pickFiles(allowMultiple: false);
                      if (pickfile == null) {
                        ScaffoldMessenger(child: Text(" pick a file"));
                      } else {
                        final adhar = pickfile.files.single.path;
                        setState(() {
                          reqfile = File(adhar!);
                        });
                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: white,
                            border:
                                Border.all(color: color ? navy : Colors.red)),
                         height:55,
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          
                            Icon(
                              Icons.file_upload_outlined,
                              color: blackish,
                            ),
                           
                            Text(
                              ("Require Adhar card"),
                              style: demofont,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: 5),
                  TextButton(
                    onPressed: () async {
                      enrollmentfiles = await FilePicker.platform
                          .pickFiles(allowMultiple: false);
                      if (enrollmentfiles == null) {
                        ScaffoldMessenger(child: Text(" pick a file"));
                      } else {
                        final enrollment = enrollmentfiles.files.single.path;
                        setState(() {
                          enrollmentid = File(enrollment!);
                        });
                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: white,
                            border:
                                Border.all(color: color ? navy : Colors.red)),
                        height:55,
                        width: 300,
                        // padding: const EdgeInsets.symmetric(
                        //   vertical: 15.0,
                        //   horizontal: 15.0,
                        // ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            
                            Icon(
                              Icons.file_upload_outlined,
                              color: blackish,
                            ),
                            
                            Text(
                              (" Require Enrollment ID"),
                              style: demofont,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: 20),
    
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height:50,
                        width: 150,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.green,
                          elevation: 7.0,
                          child: TextButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                if (pickfile == null) {
                                  showCupertinoDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            backgroundColor: white,
                                            title: Text(
                                              " Please upload Your adhar ID",
                                              style: demofont,
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Back",
                                                    style: demofont,
                                                  )),
                                            ],
                                          ));
                                  //  Scaffold.of(scaffoldContext).showSnackBar(snackBar);
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(content: Text("Pick a file")));
    
                                  setState(() {
                                    color = true;
                                  });
                                } else {
                                  if (enrollmentfiles == null) {
                                    showCupertinoDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              backgroundColor: white,
                                              title: Text(
                                                " Please upload Your Enrollment ID",
                                                style: demofont,
                                              ),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Back",
                                                      style: demofont,
                                                    )),
                                              ],
                                            ));
                                    //  Scaffold.of(scaffoldContext).showSnackBar(snackBar);
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //     SnackBar(content: Text("Pick a file")));
    
                                    setState(() {
                                      color = true;
                                    });
                                  } else {
                                    joiningform();
                                    uploadadhar();
                                    uploadenrollmentid();
                                    Navigator.of(context).pop();
    
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text("Submitted"),
                                    ));
                                  }
                                  // joiningform();
                                  // uploadadhar();
                                  // uploadenrollmentid();
                                  // Navigator.of(context).pop();
    
                                  // ScaffoldMessenger.of(context)
                                  //     .showSnackBar(SnackBar(
                                  //   content: Text("Submitted"),
                                  // ));
                                }
                              }
                            },
                            child: Center(child: Text('Submit', style: dfont)),
                          ),
                        ),
                      ),
                      Container(
                        height:50,
                        width:150,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.red,
                          elevation: 7.0,
                          child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Back', style: dfont)),
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
      "prefered Area": preferedarea,
      "Okay to Associaate": careersopt,
      // "adhar card": reqfile,
      // "Enrollment id": enrollmentid
    }).then((value) => SnackBar(content: Text("Updated")));
  }

  // adharfile() async {
  //   final pickfile = await FilePicker.platform.pickFiles(allowMultiple: false);
  //   if (pickfile == null) {
  //     return ScaffoldMessenger(child: Text(" pick a file"));
  //   } else {
  //     final adhar = pickfile.files.single.path;
  //     setState(() {
  //       reqfile = File(adhar!);
  //     });
  //   }
  // }

  // enrollmentfile() async {
  //   final pickfile = await FilePicker.platform.pickFiles(allowMultiple: false);
  //   if (pickfile == null) {
  //     return ScaffoldMessenger(child: Text(" pick a file"));
  //   } else {
  //     final enrollment = pickfile.files.single.path;
  //     setState(() {
  //       enrollmentid = File(enrollment!);
  //     });
  //   }
  // }

  uploadadhar() async {
    if (reqfile == null) {
      return ScaffoldMessenger(child: Text("File has not upload"));
    }
    final filename = basename(reqfile!.path);
    final destination = "Adhar card/$filename";
    FirebaseApi.uploadadhar(destination, reqfile!);
  }

  uploadenrollmentid() async {
    if (enrollmentid == null) {
      return ScaffoldMessenger(child: Text("File has not upload"));
    }
    final filename = basename(enrollmentid!.path);
    final destination = "Enrollment ID/$filename";
    FirebaseApi.uploadenrollmentid(destination, enrollmentid!);
  }
}
