import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/hospital_model.dart';
import 'package:doctor_appointment_app/Models/hospital_review.dart';
import 'package:doctor_appointment_app/view/favorite.dart';
import 'package:doctor_appointment_app/view/hospital_details.dart';
import 'package:doctor_appointment_app/view_model/hospital_favorite_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HospitalCard extends StatefulWidget {
  HospitalCard({
    super.key,
    required this.widthParam,
    this.hospitalModel,
  });
  final double widthParam;
  HospitalModel? hospitalModel;

  @override
  State<HospitalCard> createState() => _HospitalCardState();
}

class _HospitalCardState extends State<HospitalCard> {
  double? rating;

  @override
  void initState() {
    super.initState();
    // Call the method to calculate the rating
    calculateAndSetRating();
  }

  Future<void> calculateAndSetRating() async {
    double calculatedRating = await calculateRating(widget.hospitalModel!);
    setState(() {
      rating = calculatedRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hospitalViewModel = Provider.of<HospitalFavoriteViewModel>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HospitalDetails(
                      hospitalDoc: widget.hospitalModel!,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Container(
          width: widget.widthParam,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(.4)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Stack(alignment: Alignment.bottomRight, children: [
                Container(
                    // color: Colors.blue,
                    height: 130,
                    width: widget.widthParam,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: CachedNetworkImage(
                        imageUrl: widget.hospitalModel!.image.toString(),
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey,
                          child: Center(
                            child: BlurHash(
                              hash: "LKN]Rv%2Tw=w]~RBVZRi};RPxuwH",
                              imageFit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )),
                Container(
                  height: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(
                      //   height: 0,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: InkWell(
                          onTap: () {
                            //here to create favorite Hospital
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(.6),
                            ),
                            child: StreamBuilder<bool>(
                              stream: hospitalViewModel.CheckLikedOrNot(
                                  widget.hospitalModel!),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return SpinKitThreeBounce(
                                    color: Colors.blue,
                                    size: 10,
                                  );
                                } else if (snapshot.hasError) {
                                  return Text("Error ${snapshot.error}");
                                } else {
                                  return snapshot.data == false
                                      ? InkWell(
                                          onTap: () async {
                                            // favoriteViewModel.doctorLiked(
                                            //   widget.doctorDoc!,
                                            //   context,
                                            // );

                                            hospitalViewModel.hospitalLiked(
                                                widget.hospitalModel!, context);
                                          },
                                          child: Icon(
                                            Icons.favorite_border_rounded,
                                            color: Colors.white,
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    FavoriteScreen(),
                                              ),
                                            );
                                            // favoriteViewModel.deleteFavoriteDoctor(favoriteDoc)
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                          ));
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.all(8.0),
                      //   child: Container(
                      //     width: 55,
                      //     height: 23,
                      //     decoration: const BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.only(
                      //           topLeft: Radius.circular(12),
                      //           topRight: Radius.circular(8),
                      //           bottomLeft: Radius.circular(12),
                      //         )),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Icon(
                      //           Icons.star,
                      //           color: Colors.yellow,
                      //           size: 16,
                      //         ),
                      //         SizedBox(
                      //           width: 5,
                      //         ),
                      //         // FutureBuilder(
                      //         //     future:
                      //         //         calculateRating(widget.hospitalModel!),
                      //         //     builder: (context, snapshot) {
                      //         //       if (snapshot.connectionState ==
                      //         //           ConnectionState.waiting) {
                      //         //         return SpinKitThreeBounce(
                      //         //           color: Colors.blue,
                      //         //           size: 15,
                      //         //         );
                      //         //       } else if (snapshot.hasError) {
                      //         //         return Text("Error: ${snapshot.error}");
                      //         //       }else{
                      //         //         return Text("${snapshot.data.rating}")
                      //         //       }
                      //         //     })
                      //         // FutureBuilder<double>(
                      //         //     future:
                      //         //         calculateRating(widget.hospitalModel!),
                      //         //     builder: (context, snapshot) {
                      //         //       if (snapshot.connectionState ==
                      //         //           ConnectionState.waiting) {
                      //         //         return SpinKitThreeBounce(
                      //         //           color: Colors.blue,
                      //         //           size: 15,
                      //         //         );
                      //         //       } else if (snapshot.hasError) {
                      //         //         return Text("Error: ${snapshot.error}");
                      //         //       } else {
                      //         //         // Handle the case where data is available
                      //         //         double? rating = snapshot.data;
                      //         //         return Text(rating != null
                      //         //             ? rating.toString()
                      //         //             : 'No rating available');
                      //         //       }
                      //         //     })
                      //         Text(rating.toString())
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )
              ]),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8, top: 5),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.hospitalModel!.name.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    // Spacer(),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon(
                        //   Icons.safety_check,
                        //   size: 16,
                        //   color: Colors.blue,
                        // ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("${widget.hospitalModel!.specializeIn}")
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<double> calculateRating(HospitalModel hospitalDoc) async {
    try {
      // Get the list of reviews for the specified hospital
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection("HospitalReview")
              .where("hospitalRef",
                  isEqualTo: FirebaseFirestore.instance
                      .collection("Hospital")
                      .doc(hospitalDoc.uid))
              .get();

      // Calculate the total rating and count of reviews
      double totalRating = 0;
      int reviewCount = querySnapshot.docs.length;

      // Iterate through the reviews to sum up the ratings
      querySnapshot.docs.forEach((doc) {
        HospitalReviewModel review = HospitalReviewModel.fromMap(doc.data());
        totalRating += review.rating ?? 0; // Ensure rating is not null
        print("Total Rating: $totalRating");
      });

      // Calculate the average rating
      double averageRating = reviewCount > 0 ? totalRating / reviewCount : 0;

      return averageRating;
    } catch (e) {
      print("Error calculating rating: $e");
      return 0; // Return 0 in case of an error
    }
  }
}
