// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:indolawassociates/UI/constant/constant.dart';
// import 'package:indolawassociates/UI/dummy/Mapping.dart';
// import 'package:indolawassociates/UI/provider/location_provider.dart';
// import 'package:indolawassociates/UI/routes/route.dart';
// import 'package:provider/provider.dart';

// class Mappu extends StatefulWidget {
//   Mappu({Key? key}) : super(key: key);

//   @override
//   _MappuState createState() => _MappuState();
// }

// class _MappuState extends State<Mappu> {
//   @override
//   Widget build(BuildContext context) {
//     final area = Provider.of<Locationprovider>(context);

//     return Scaffold(
//       appBar: AppBar(leading: IconButton(onPressed: (){Navigator.pushNamed(context,homeroute);}, icon: Icon(Icons.ac_unit)),),
//       body: Column(
//         children: [
//           Center(
//             child: FlatButton(
//                 onPressed: () async {
//                   await area.getcurrentlocation();
//                   servicetaken();
//                   if (area.permissionallowed == true) {
//                     servicetaken();
//                     // Navigator.pushReplacement(context,
//                     //     MaterialPageRoute(builder: (context) => Mappinglot()));
//                   } else {
//                     print("Not allowd");
//                   }
//                 },
//                 child: Text("location")),
//           ),
//           Text(area.selectedAddress.toString())
//         ],
//       ),
//     );
//   }

//   Future<void> servicetaken() async {
//     final area = Provider.of<Locationprovider>(context);

//     CollectionReference locationpicked =
//         FirebaseFirestore.instance.collection("Quick services");
//     return locationpicked
//         .add({"location": area.selectedAddress.toString()}).then(
//             (value) => SnackBar(content: Text("Contact you soon")));
//   }
// }



// // class Mappinglot extends StatefulWidget {
// //   Mappinglot({Key? key}) : super(key: key);

// //   @override
// //   _MappinglotState createState() => _MappinglotState();
// // }

// // class _MappinglotState extends State<Mappinglot> {
// //   LatLng? currentlocation;
// //   GoogleMapController? _controller;
// //   @override
// //   Widget build(BuildContext context) {
// //     final area = Provider.of<Locationprovider>(context);

// //     void oncreated(GoogleMapController controller) {
// //       setState(() {
// //         _controller = controller;
// //       });
// //     }

// //     setState(() {
// //       currentlocation =
// //           LatLng(area.latitude!.toDouble(), area.longitude!.toDouble());
// //     });
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           GoogleMap(
// //             initialCameraPosition: CameraPosition(
// //               target: currentlocation!,
// //               zoom: 14.4547,
// //             ),
// //             zoomControlsEnabled: false,
// //             minMaxZoomPreference: MinMaxZoomPreference(1.5, 20.8),
// //             myLocationEnabled: true,
// //             myLocationButtonEnabled: true,
// //             mapType: MapType.normal,
// //             mapToolbarEnabled: true,
// //             onCameraMove: (CameraPosition cameraPosition) {
// //               area.oncameramove(cameraPosition);
// //             },
// //             onMapCreated: oncreated,
// //             onCameraIdle: () {
// //               area.getaddress();
// //             },
// //           ),
// //           Center(
// //               child: Image.asset(
// //             "assets/images/malelaw.png",
// //             height: 50,
// //           )),
// //           Positioned(
// //               bottom: 0,
// //               child: Container(
// //                 width: MediaQuery.of(context).size.width,
// //                 height: 200,
// //                 color: white,
// //                 child: Column(children: [Text(area.selectedAddress!)],),
// //               ))
// //         ],
// //       ),
// //     );
// //   }
// // }
