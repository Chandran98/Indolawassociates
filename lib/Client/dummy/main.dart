// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// import '../Pages/Register_Login_screen/Login.dart/log.dart';
// final FirebaseAuth _auth = FirebaseAuth.instance;
// final FirebaseFirestore _firestore= FirebaseFirestore.instance;
// var username ='';

// class Mainscreeen extends StatefulWidget {
//   Mainscreeen({Key? key}) : super(key: key);

//   @override
//   _MainscreeenState createState() => _MainscreeenState();
// }

// class _MainscreeenState extends State<Mainscreeen> {
//   @override
// //   void initState() {
// // getuser();    super.initState();
// //   }
//   // signOut() {
//   //   //redirect
//   //   _auth.signOut().then((value) => Navigator.pushReplacement(context,
//   //       MaterialPageRoute(builder: (BuildContext context) => Loginpage())));
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // title: Text("Hi"+username,style: TextStyle(color: Colors.red),),
//       ),
//       // // body: Column(children: [Text("MObile"+ (_auth.currentUser!.phoneNumber=  _auth.currentUser!.phoneNumber:''))],),
//       // floatingActionButton: FloatingActionButton(onPressed: (){signOut(); },),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection("ILA").snapshots(),
//          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) { return Container(
//            child: Text("data"),
//          ); }
        
        
//       ),
//     );
    
//   }



//   // Future getuser()async{
//   //   if(_auth.currentUser!=null){
//   //     var cellNumber =_auth.currentUser!.phoneNumber;
//   //     cellNumber='0'+_auth.currentUser!.phoneNumber!.substring(3,cellNumber!.length);
//   //     debugPrint(cellNumber);
//   //     await _firestore.collection("ILA").where("cellnumber",isEqualTo: cellNumber).get().then((result) {if(result.docs.length >0){
//   //       setState(() {
//   //         username=result.docs[0].data()['name'];
//   //       });
//   //     }});
//   //   }
//   // }
// }
