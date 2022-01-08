import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:provider/provider.dart';

import 'connectivity.dart';

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
    
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child:Container(color: white,width: double.infinity,
          child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100),
                      child: Expanded(
                        child: Container(
                            // color: Colors.green,
                            height: 50,
                            width: 50,
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
                        style: demofont,
                      ),
                    ),
                  ],
                ),
         ),
    
    );
  
  }
}
