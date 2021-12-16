import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Slisder extends StatefulWidget {
  Slisder({Key? key}) : super(key: key);

  @override
  _SlisderState createState() => _SlisderState();
}

class _SlisderState extends State<Slisder> {
  @override
  void initState() {
    super.initState();
    getslider();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xffF5F5F5),
      // color: white,

      child: FutureBuilder(
        future: getslider(),
        // initialData: InitialData,
        builder: (BuildContext context,
            AsyncSnapshot<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
                snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return CarouselSlider.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index, int) {
                DocumentSnapshot<Map<String, dynamic>> slider =
                    snapshot.data![index];
                Map<String, dynamic>? fetchimage = slider.data();
                return Card(
                    // color: Color(0xffF5F5F5),
                    elevation: 4,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: fetchimage!["images"],
                    ));
              },
              options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  height: MediaQuery.of(context).size.height * 0.2.h,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  onPageChanged: (i, carouselPageChangedReason) {
                    setState(() {
                      index = i;
                    });
                  }),
            );
          }
        },
      ),
    );
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getslider() async {
    FirebaseFirestore silder = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await silder.collection("Club Membership").get();
    return snapshot.docs;
  }
}
