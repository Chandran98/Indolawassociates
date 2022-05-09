import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indolawassociates/UI/components/snack_bar.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/services/app_services.dart';

import 'package:cached_network_image/cached_network_image.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Editprofile extends StatefulWidget {
  // Editprofile({Key? key}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  String? name;
  String imageUrl = "";

  File? imageFile;
  String? fileName;
  bool loading = false;

  var formKey = GlobalKey<FormState>();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var nameCtrl = TextEditingController();
  var emailCtrl = TextEditingController();
  var locationCtrl = TextEditingController();

  Future pickimage() async {
    var imagepicked = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);

    if (imagepicked != null) {
      setState(() {
        imageFile = File(imagepicked.path);
        fileName = (imageFile!.path);
      });
    } else {
      print("object");
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("Pick a image")));
    }
  }

  Future uploadpicture() async {
    Reference storage = FirebaseStorage.instance
        .ref()
        .child("ProfilePic/${_auth.currentUser!.uid}");
    UploadTask uploadTask = storage.putFile(imageFile!);
    await uploadTask.whenComplete(() async {
      var _url = await storage.getDownloadURL();
      var _imageurl = _url.toString();
      setState(() {
        imageUrl = _imageurl;
      });
    });
  }

  updatetoDB() async {
    await Appservies().checkInternet().then((connection) async {
      if (connection == false) {
        openSnacbar(scaffoldKey, "no internet");
      } else {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          setState(() => loading = true);
          imageFile == null
              ? await updateprofile(
                  nameCtrl, imageUrl, emailCtrl, currentAddress)
              : await uploadpicture()
                  .then((value) => updateprofile(
                      nameCtrl.text, imageUrl, emailCtrl.text, currentAddress))
                  .then((_) {
                  openSnacbar(scaffoldKey, "Updated successfully");
                  setState(() {
                    loading = false;
                  });
                });
        }
      }
    });
  }

  void onback() {
    Navigator.pushNamed(context, settingsroute);
  }

  String currentAddress = 'Address';
  Position? currentposition;

  // ignore: unused_element
  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      setState(() {
        currentposition = position;
        currentAddress =
            "${place.name},${place.thoroughfare},${place.subThoroughfare}\n${place.locality} - ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text("Edit Profile"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // padding: EdgeInsets.all(25),
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey[200],
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.grey[500]!),
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: (imageFile == null
                                      ? CachedNetworkImageProvider(imageUrl)
                                      : FileImage(imageFile!))
                                  as ImageProvider<Object>,
                              fit: BoxFit.cover)),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              pickimage();
                            },
                            child: Icon(
                              Icons.edit_outlined,
                              size: 30,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter new name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            controller: nameCtrl,
                            validator: (value) {
                              if (value!.length == 0)
                                return "Name can't be empty";
                              return null;
                            },
                          ),
                          spaced20,
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter your Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            controller: emailCtrl,
                            validator: (value) {
                              if (value!.length == 0)
                                return "Email can't be empty";
                              return null;
                            },
                          ),
                          // spaced20,
                          // TextFormField(
                          //   decoration: InputDecoration(
                          //     hintText: 'Address',
                          //   ),
                          //   controller: locationCtrl,
                          //   validator: (value) {
                          //     if (value!.length == 0)
                          //       return "Address can't be empty";
                          //     return null;
                          //   },
                          // ),
                          spaced20,
                          InkWell(
                              onTap: () {
                                _determinePosition();
                              },
                              child: Container(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      //  Border.symmetric(horizontal: BorderSide(width: 0.5,color: blackish))
                                      border: Border.all(
                                          width: 0.5, color: Colors.black54)),
                                  child: Text(
                                    currentAddress,
                                    style: TextStyle(fontSize: 16),
                                  )))
                        ],
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      height: 55,
                      width: 250,
                      decoration: BoxDecoration(
                          color: appcolor,
                          borderRadius: BorderRadius.circular(30)),
                      child: InkWell(
                        onTap: () {
                          updatetoDB();
                        },
                        child: loading == true
                            ? Center(child: CircularProgressIndicator())
                            : Center(
                                child: Text(
                                "Update Profile",
                                style: GoogleFonts.poppins(color: white),
                              )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  updateprofile(name, imageurl, email, location) {
    return FirebaseFirestore.instance
        .collection("ILA")
        .doc(_auth.currentUser!.uid)
        .update({
      "name": name,
      "image": imageUrl,
      "location": location,
      "email": email
    });
  }
}
