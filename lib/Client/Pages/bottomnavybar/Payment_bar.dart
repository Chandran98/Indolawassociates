import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';

import '../../../main.dart';


class Paymentbar extends StatefulWidget {
  @override
  _PaymentbarState createState() => _PaymentbarState();
}

class _PaymentbarState extends State<Paymentbar> { 
  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Mainhome()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(  onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: navy,
            title: Text(
              "Payment",
              style: GoogleFonts.mulish(
                  color: white, fontWeight: FontWeight.w500, fontSize: 21),
            ),
            leading: IconButton(
                onPressed: () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Mainhome())),
                icon: Icon(
                  Icons.arrow_back,
                  color: white,
                )),
          ),
          body: Container(
            decoration: BoxDecoration(color: Colors.black),
            child: SingleChildScrollView(
              child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/Payment_image.jpg"),
                              fit: BoxFit.fill)),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.55,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22))),
                      padding: EdgeInsets.only(left: 30, right: 30, top: 50),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                                height: MediaQuery.of(context).size.height*0.01
                            ),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/razor.png"),
                                      fit: BoxFit.contain),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(3, 3),
                                        blurRadius: 2)
                                  ],
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.white,
                                ),
                                height: 110,
                                width: 300,
                              ),
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height*0.01
                                ),
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/upi.png"),
                                    fit: BoxFit.contain),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(3, 3),
                                      blurRadius: 2)
                                ],
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                              ),
                              height: 120,
                              width: 300,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [navy, Colors.lightBlue]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                height: MediaQuery.of(context).size.height*0.09,
                                width:  MediaQuery.of(context).size.width*0.4,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: FittedBox(
                                      child: Text(
                                        "Proceed",
                                        style: GoogleFonts.mulish(
                                            color: white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
    
    // can't Login////
                    )
                  ],
                ),
            ),
          )),
    );
  }
}
