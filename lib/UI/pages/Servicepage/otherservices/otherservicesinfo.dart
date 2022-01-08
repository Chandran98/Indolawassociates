import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/button.dart';
import 'package:indolawassociates/UI/components/contact_box.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/UI/models/form_model.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';

class OTherservicesinfo extends StatefulWidget {
  const OTherservicesinfo(
      {Key? key,
      required this.servicetitle,
      required this.servicecontent,
      required this.serviceimage})
      : super(key: key);

  final String servicetitle, servicecontent, serviceimage;

  @override
  _OTherservicesinfoState createState() => _OTherservicesinfoState();
}

class _OTherservicesinfoState extends State<OTherservicesinfo> {
  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // ignore: unused_field
  late FormModel _formModel;

  var whatsapp = "+91 8940383000";

  final _namecontroller = TextEditingController();
  // final _gendercontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _mobilecontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _servicecontroller = TextEditingController();

  var gendertry;
  List genderlist = ["Male", "Female", "Others"];
  @override
  void dispose() {
    _namecontroller.dispose();
    _mobilecontroller.dispose();
    _emailcontroller.dispose();
    _servicecontroller.dispose();
    _servicecontroller.dispose();
    _addresscontroller.dispose();
    super.dispose();
  }

  void onback() {
    Navigator.pushNamed(context, servicespage);
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
                body: Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: IconButton(
                            iconSize: 40,
                            color: white,
                            icon: Image.asset(
                              "assets/icons/rback.png",
                              color: iconcolor,
                              height: 40,
                            ),
                            onPressed: () =>
                                Navigator.pushNamed(context, servicespage)),
                      ),
                      Expanded(
                        child: AutoSizeText(widget.servicetitle,
                            textAlign: TextAlign.center,
                            style: titletextblack),
                      )
                    ],
                  ),
                  spaced30,
                  Card(
                    elevation: 4,
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.serviceimage),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  spaced30,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      widget.servicecontent,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: black),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  spaced20,
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: white,
                            border: Border.all(color: black)),
                        height: 50,
                        width: 150,
                        // padding: const EdgeInsets.symmetric(
                        //   vertical: 15.0,
                        //   horizontal: 15.0,
                        // ),
                        child: Center(
                          child: Text(
                            translate!.apply,
                            style: GoogleFonts.poppins(
                                // fontWeight: FontWeight.bold,
                                color: black,
                                fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),
                  // CustomButton(
                  //   style: GoogleFonts.poppins(
                  //       // fontWeight: FontWeight.bold,
                  //       color: black,
                  //       fontSize: 11.sp),
                  //   height: height * 0.06,
                  //   text: translate!.apply,
                  //   width: width * 0.4,
                  //   onpressed: () => showModalBottomSheet(
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.vertical(
                  //               top: Radius.circular(25))),
                  //       enableDrag: false,
                  //       isScrollControlled: true,
                  //       context: context,
                  //       builder: (context) => SingleChildScrollView(
                  //             child: Container(
                  //               padding: EdgeInsets.only(
                  //                   bottom: MediaQuery.of(context)
                  //                       .viewInsets
                  //                       .bottom),
                  //               child: buildformsheet(),
                  //             ),
                  //           )),
                  // ),
                 spaced30,
                  Contactbox(),
                ],
              ),
            ),
          ),
        ))));
  }

  Widget buildformsheet() => SafeArea(
        child: SingleChildScrollView(
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
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Fill The Form",
                          style: GoogleFonts.poppins(
                              color: black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ),
                      spaced30,
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
                                color: black,
                              ),
                              labelText: "Email",
                              labelStyle: demofont)),
                      SizedBox(height: 20),

                      //   TextFormField(
                      //     controller: _gendercontroller,
                      //     decoration: InputDecoration(
                      //         border: OutlineInputBorder(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(20))),
                      //         labelText: "Gender",
                      //         labelStyle: TextStyle(
                      //             color: black, fontWeight: FontWeight.bold))),
                      // SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.all(5),
                        child: DropdownButton(
                          underline: SizedBox(),
                          iconSize: 35,
                          iconEnabledColor: black,
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          hint: Text("Gender", style: demofont),
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
                                color: black,
                              ),
                              labelText: "Mobile",
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
                              labelText: "Address",
                              labelStyle: demofont)),
                      SizedBox(height: 20),

                      TextFormField(
                          controller: _servicecontroller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              labelText: "Services",
                              labelStyle: demofont)),
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
                            height: 50,
                            width: 150,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.green,
                              elevation: 7.0,
                              child: TextButton(
                                onPressed: ()
                                    //                               {

                                    async {
                                  if (_formkey.currentState!.validate()) {
                                    servicesform();
                                    // String name = _namecontroller.text;
                                    // String email = _emailcontroller.text;
                                    // String address = _addresscontroller.text;
                                    // String gender = gendertry;
                                    // String mobile = _mobilecontroller.text;
                                    // String service = _servicecontroller.text;

                                    // FormModel forms = await submitdata(name,
                                    //     gender, email, address, mobile, service);
                                    // setState(() {
                                    //   _formModel = forms;
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
                            height: 50,
                            width: 150,
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
        ),
      );
  Future<void> servicesform() async {
    // FirebaseAuth _auth = FirebaseAuth.instance;

    CollectionReference lawyerform =
        FirebaseFirestore.instance.collection("ILA Services forms");
    return lawyerform.add({
      "Name": _namecontroller.text.trim(),
      "Mobile": _mobilecontroller.text.trim(),
      "Email": _emailcontroller.text.trim(),
      "Services": _servicecontroller.text.trim(),
      "Address": _addresscontroller.text.trim(),
      "Gender": gendertry
    }).then((value) => SnackBar(content: Text("Updated")));
  }
}
