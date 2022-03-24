import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/components/Internet%20connectivity/connectivity.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


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
                  children: [SizedBox(height: 50,),
                    Container(
                        // color: Colors.green,
                        height: 300,
                        width: 300,
                        // child: Image.asset("assets/images/wifioff.jpg")
                        child: Lottie.asset("assets/images/wifi.json"),
                        ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    Text(
                      "No internet Connection \n  Check your internet connection and try again",
                      textAlign: TextAlign.center,
                      style: demofont,
                    ),
                  ],
                ),
         ),
    
    );
  
  }
}
