import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
// import 'package:indolawassociates/UI/models/form_model.dart';

class Otherservicesform extends StatefulWidget {
  Otherservicesform({Key? key}) : super(key: key);

  @override
  _OtherservicesformState createState() => _OtherservicesformState();
}

class _OtherservicesformState extends State<Otherservicesform> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // ignore: unused_field
  // late FormModel _formModel;
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _mobilecontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _servicecontroller = TextEditingController();

  var gendertry;
  List genderlist = ["Male", "Female", "Others"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                          fontWeight: FontWeight.w500, fontSize: 20),
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
                        ),
                        labelText: "Name",
                      )),
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
                        ),
                        labelText: "Email",
                      )),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(5),
                    child: DropdownButton(
                      underline: SizedBox(),
                      iconSize: 35,
                      isExpanded: true,
                      hint: Text(
                        "Gender",
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
                        ),
                        labelText: "Mobile",
                      )),
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
                      )),
                  SizedBox(height: 20),
                  TextFormField(
                      controller: _servicecontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        labelText: "Services",
                      )),
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
                                servicesform();
                                _emailcontroller.clear();
                                _namecontroller.clear();
                                _mobilecontroller.clear();
                                _addresscontroller.clear();
                                _servicecontroller.clear();

                                Navigator.of(context).pop();

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Submitted"),
                                ));
                              }
                            },
                            child: Center(
                                child: Text('Submit',
                                    style:
                                        TextStyle(color: white, fontSize: 20))),
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
                                    style:
                                        TextStyle(color: white, fontSize: 20))),
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
