import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/utils/Internet%20connectivity/connectivity.dart';
import 'package:provider/provider.dart';

class NetworkSensitive extends StatelessWidget {
  final double opacity;
  final Widget child;
  NetworkSensitive({required this.child, this.opacity = 1});
// ignore: empty_constructor_bodies

  @override
  Widget build(BuildContext context) {
    var connectionstatus = Provider.of<ConnectivityStatus>(context);

    if (connectionstatus == ConnectivityStatus.Wifi) {
      return child;
    }
    if (connectionstatus == ConnectivityStatus.Mobile) {
      return child;
    }
    return SafeArea(
      child:Container(color: white,width: double.infinity,
          child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 130),
                      child: Expanded(
                        child: Container(
                            color: Colors.white,
                            height: 100.h,
                            width: 100.h,
                            child: Image.asset("assets/images/wifioff.jpg")),
                      ),
                    ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    Expanded(
                      child: Text(
                        "No internet Connection \n  Check your internet connection and try again",
                        textAlign: TextAlign.center,
                        style: hStyle,
                      ),
                    ),
                  ],
                ),
         ),
    
    );
  
  }
}
