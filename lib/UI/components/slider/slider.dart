import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/routes/route.dart';

class Bannerslider extends StatefulWidget {
  Bannerslider({Key? key}) : super(key: key);

  @override
  _BannersliderState createState() => _BannersliderState();
}

class _BannersliderState extends State<Bannerslider> {
  @override
  void initState() {
    super.initState();
    getslider();
  }

  int index = 0;
  var image; 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.23,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, offerroute);
        },
        child: FutureBuilder(
          future: getslider(),
          builder: (BuildContext context,
              AsyncSnapshot<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
                  snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                color: green,
              ));
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 15),
                child: CarouselSlider.builder(
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
                        fit: BoxFit.fitWidth,
                        imageUrl: image,
                        // ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                      initialPage: 0,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      viewportFraction: 0.99,
                      onPageChanged: (i, carouselPageChangedReason) {
                        setState(() {
                          index = i;
                        });
                      }),
                ),
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
