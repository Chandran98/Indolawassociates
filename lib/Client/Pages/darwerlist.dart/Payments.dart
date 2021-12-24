import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Homepage/drawer.dart';
import 'package:indolawassociates/Client/constants/constant.dart';


class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> { void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Maindrawer()));
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: navy,
            title: Text(
              "Payment",
              style: GoogleFonts.mulish(
                  color: white, fontWeight: FontWeight.w500, fontSize: 20),
            ),
            leading: IconButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Maindrawer())),
                icon: Icon(
                  Icons.arrow_back,
                  color: white,
                )),
          ),
          body: Container(
            decoration: BoxDecoration(color: Colors.black),
            child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/p1.jpg"),
                              fit: BoxFit.fill)),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22))),
                      padding: EdgeInsets.only(left: 30, right: 30, top: 50),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
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
                            height: 10,
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
                              height: MediaQuery.of(context).size.height*0.8,
                              width: 170,
                              child: GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    "Proceed",
                                    style: GoogleFonts.mulish(
                                        color: white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
    
    // can't Login////
                    )
                  ],
                ),
             
           
          )),
    );
  }
}
