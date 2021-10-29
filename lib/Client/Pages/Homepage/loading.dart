import 'package:flutter/material.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'home.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  _LoadingState createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {
  Future<HomeScreen> downloadhome() {
    return Future.delayed(Duration(seconds: 3), () {
      return HomeScreen();
    });
  }
  
  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: Column(
        children: [Container(),
          FutureBuilder(
            
              future: downloadhome(),
              
              builder: (context, loadingsnapshot) {
                
                if (loadingsnapshot.connectionState == ConnectionState.done) {
                  
                  return HomeScreen();
                  
                } else {
                  return Center(
                      child: SizedBox(
                    height: 190,
                    width: 200,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(navy),
                      strokeWidth: 8,
                      color: navy,
                    ),
                  ));
                }
              }),
        ],
      ),
    );
  }
}
