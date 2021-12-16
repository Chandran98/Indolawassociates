import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/model/form_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../main.dart';

class Catepage extends StatefulWidget {
  const Catepage({
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
  _CatepageState createState() => _CatepageState();
}

class _CatepageState extends State<Catepage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // ignore: unused_field
  late FormModel _formModel;

  final _namecontroller = TextEditingController();
  // ignore: unused_field
  final _gendercontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _mobilecontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _servicecontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _gendercontroller.dispose();
    _emailcontroller.dispose();
    _mobilecontroller.dispose();
    _servicecontroller.dispose();
    _namecontroller.dispose();
    _emailcontroller.dispose();
  }

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

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
        
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.065.h,
          backgroundColor: white,
          title: Text(widget.categorytitle,
              style: GoogleFonts.mulish(
                  fontSize: 18.5.sp, fontWeight: FontWeight.w500, color: navy)),
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Mainhome())),
              icon: Icon(
                Icons.arrow_back,
                color: navy,
              )),
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   backgroundColor: gold,
        //   onPressed: () => showModalBottomSheet(
        //       shape: RoundedRectangleBorder(
        //           borderRadius:
        //               BorderRadius.vertical(top: Radius.circular(25))),
        //       enableDrag: false,
        //       isScrollControlled: true,
        //       context: context,
        //       builder: (context) => SingleChildScrollView(
        //             child: Container(
        //               padding: EdgeInsets.only(
        //                   bottom: MediaQuery.of(context).viewInsets.bottom),
        //               child: buildformsheet(),
        //             ),
        //           )),
        //   label: Text(
        //     "Apply for issues",
        //   ),
        //   icon: Icon(Icons.arrow_back_ios_new_rounded),
        // ),

        body: SingleChildScrollView(
            child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.categorypageimages),
                      fit: BoxFit.cover)),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical:500.0),
            //   child:
            // )
            Padding(
              padding: const EdgeInsets.only(top: 170),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6.h,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical:20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.categorytitle,
                              style: bStyle,
                              textScaleFactor: 1,
                            ),
                            InkWell(
                              onTap: () => showModalBottomSheet(
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
                                height: MediaQuery.of(context).size.height *
                                    0.045.h,
                                width: MediaQuery.of(context).size.width *
                                    0.36.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: gold,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: white,
                                      size: 22,
                                    ),
                                    Text(
                                      translate!.apply,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.sp,
                                          color: white),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
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
                              MediaQuery.of(context).size.height * 0.025.h,
                        ),
                        Text(
                          widget.categorysubtitle,
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp,
                              color: navy),
                          textAlign: TextAlign.justify,
                          // textScaleFactor: 1,
                        ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.03.h,
                        // ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15.h,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                color: white,
                                height: MediaQuery.of(context).size.height *
                                    0.2.h,
                                width: MediaQuery.of(context).size.width *
                                    0.38.h,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.check, color: gold),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.r1,
                                            style: GoogleFonts.mulish(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 11.sp,
                                                color: navy),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.check, color: gold),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.r3,
                                            style: GoogleFonts.mulish(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 11.sp,
                                                color: navy),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.check, color: gold),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.r5,
                                            style: GoogleFonts.mulish(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 11.sp,
                                                color: navy),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                color: white,
                                width:
                                    MediaQuery.of(context).size.width * 0.4.w,
                                height: MediaQuery.of(context).size.height *
                                    0.2.h,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.check, color: gold),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.r2,
                                            style: GoogleFonts.mulish(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 11.sp,
                                                color: navy),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.check, color: gold),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.r4,
                                            style: GoogleFonts.mulish(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 11.sp,
                                                color: navy),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.r6,
                                            style: GoogleFonts.mulish(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 11.sp,
                                                color: navy),
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
              
                        Text(
                          translate.drawerkey5,
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: gold),
                          textAlign: TextAlign.justify,
                          textScaleFactor: 1,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01.h,
                        ),
                        InkWell(
                          onTap: () {
                            launcher("mailto: indolawassociates@gmail.com");
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.mail,
                                color: navy,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "info@indolawassociates.com",
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01.h,
                        ),
                        InkWell(
                          onTap: () {
                            launcher("tel: 8940383000");
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.call_sharp,
                                color: navy,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "8940383000",
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer_rounded,
                              color: navy,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "${translate.workingshift}: 8am-6pm",
                              style: GoogleFonts.mulish(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: navy),
                              textAlign: TextAlign.justify,
                              textScaleFactor: 1,
                            ),
                          ],
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

// Future<FormModel> submitdata(
//     String name, gender, email, address, mobile, service) async {
//   var response = await http.post(
//       Uri.parse("http://api.indolawassociates.com/public/api/form"),
//       body: {
//         "name": name,
//         "gender": gender,
//         "email": email,
//         "address": address,
//         "mobile": mobile,
//         "service": service,
//       });

//   final data = response.body;
//   return formModelFromJson(data);
// }
