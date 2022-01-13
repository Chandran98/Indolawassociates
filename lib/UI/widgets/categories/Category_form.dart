
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/form_model.dart';

class Buildformsheet extends StatefulWidget {
  Buildformsheet({Key? key}) : super(key: key);

  @override
  _BuildformsheetState createState() => _BuildformsheetState();
}

class _BuildformsheetState extends State<Buildformsheet> {
  
  late FormModel _formModel;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _namecontroller = TextEditingController();
  // ignore: unused_field
  final _gendercontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _mobilecontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  // final _servicecontroller = TextEditingController();

    var gendertry;
  List genderlist = ["Male", "Female", "Others"];
  var category;
  List categorylist = [
    "Property",
    "Family",
    "Criminal",
    "Corporate",
    "Cyber Crime",
    "Civil",
    "Taxation",
    "Labour",
    "Consumer"
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        //       child: Container(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("Fill The Form", style: titletextblack),
                    ),
                    spaced10,
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
                        hint: Text(
                          "Gender",
                          style: demofont,
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
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(5),
                      child: DropdownButton(
                        underline: SizedBox(),
                        onChanged: (selected) {
                          setState(() {
                            category = selected;
                          });
                         
                        },
                        value: category,
                        iconSize: 35,
                        iconEnabledColor: black,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        hint: Text(
                          "Services",
                          style: demofont,
                        ),
                        items: categorylist.map((valueitem) {
                          return DropdownMenuItem(
                            value: valueitem,
                            child: Text(valueitem),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 20),
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
                              onPressed: () async {
                                if (_formkey.currentState!.validate()) {
                                  paralegalservicesform();
                                  _namecontroller.clear();
                                  _emailcontroller.clear();
                                  _mobilecontroller.clear();
                                  _addresscontroller.clear();

                                  Navigator.of(context).pop();

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Submitted"),
                                  ));
                                } else {
                                  // ignore: unnecessary_statements
                                  (e) {
                                    return e;
                                  };
                                }
                              },
                              child:
                                  Center(child: Text('Submit', style: dfont)),
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
                              child: Center(child: Text('Back', style: dfont)),
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

 