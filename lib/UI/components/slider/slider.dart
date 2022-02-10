import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/routes/route.dart';

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
  var image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, offerroute);
      },
      child: Container(
        child: FutureBuilder(
          future: getslider(),
          // initialData: InitialData,
          builder: (BuildContext context,
              AsyncSnapshot<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
                  snapshot) {
            if (!snapshot.hasData) {
              return
                  // return  Shimmer.fromColors(baseColor: Colors.green,highlightColor: Colors.black,
                  //   child: Container(
                  //         // child: Slisder(),
                  //         height: height * 0.025.h,
                  //         width: width * 1.w,
                  //       ),
                  // );
                  Center(
                      child: CircularProgressIndicator(
                color: green,
              ));
            } else {
              return CarouselSlider.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index, int) {
                  DocumentSnapshot<Map<String, dynamic>> slider =
                      snapshot.data![index];
                  Map<String, dynamic>? fetchimage = slider.data();
                  image = fetchimage!["images"];
                  return Card(
                    color: Colors.transparent,
                    elevation: 4,
                    // child: Hero(
                    //   tag: "slider$image",
                    // child: Image.network(image),
                    child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                      imageUrl: image,
                      // ),
                    ),
                  );
                },
                options: CarouselOptions(
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    height: 180,
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
