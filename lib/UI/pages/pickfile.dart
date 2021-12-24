// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';

// class Imp extends StatefulWidget {
//   Imp({Key? key}) : super(key: key);

//   @override
//   _ImpState createState() => _ImpState();
// }

// class _ImpState extends State<Imp> {
//   // File? reqfile;
//   @override
//   Widget build(BuildContext context) {
//     // final filename= reqfile != null ? basen
//     // final fileName =
//     //     reqfile != null ? basename(reqfile!.path) : 'No File Selected';

//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           TextButton(onPressed: selectfile, child: Text("Pick file")),
//           TextButton(onPressed: uploadfile, child: Text("Upload file"))
//         ],
//       ),
//     );
//   }

//   selectfile() async {
//     final pickfile = await FilePicker.platform.pickFiles(allowMultiple: false);
//     if (pickfile == null) {
//       return ScaffoldMessenger(child: Text(" pick a file"));
//     } else {
//       final adhar = pickfile.files.single.path;
//       setState(() {
//         reqfile = File(adhar!);
//       });
//     }
//   }

//   uploadfile() async {}
// }
