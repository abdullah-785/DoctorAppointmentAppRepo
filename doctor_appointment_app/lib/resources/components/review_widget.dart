import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/hospital_review.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:doctor_appointment_app/view_model/hospital_review_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ReviewWidget extends StatelessWidget {
  ReviewWidget({
    super.key,
    this.hospitalReviewModelDoc,
  });
  HospitalReviewModel? hospitalReviewModelDoc;

  @override
  Widget build(BuildContext context) {
    final hospitalReviewViewModel =
        Provider.of<HospitalReviewViewModel>(context);
    return FutureBuilder<UserModel>(
        future: hospitalReviewViewModel.getUser(hospitalReviewModelDoc!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SpinKitThreeBounce(
              color: Colors.blue,
              size: 20,
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            UserModel userModel = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(alignment: Alignment.bottomRight, children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                userModel.image.toString(),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const Icon(Icons.verified,
                            color: Colors.blue, size: 16),
                      ]),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${userModel.name}",
                        style: TextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Text("5.0")
                            ],
                          ),
                          Text(
                            "11 month ago",
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${hospitalReviewModelDoc!.review}",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        itemSize: 16,
                        initialRating:
                            (hospitalReviewModelDoc!.rating ?? 0.0) as double,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.blue,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "5.0",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            );
          }
        });
  }
}



// Padding(
//       padding: const EdgeInsets.only(bottom: 20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Stack(alignment: Alignment.bottomRight, children: [
//                 Container(
//                   width: 40,
//                   height: 40,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.blue,
//                   ),
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(50),
//                       child: const Image(
//                         image: AssetImage("images/1.png"),
//                         fit: BoxFit.cover,
//                       )),
//                 ),
//                 const Icon(Icons.verified, color: Colors.blue, size: 16),
//               ]),
//               const SizedBox(
//                 width: 8,
//               ),
//               const Text(
//                 "Dale Thiel",
//                 style: TextStyle(fontSize: 14),
//               ),
//               const Spacer(),
//               const Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Icon(
//                         Icons.star,
//                         color: Colors.yellow,
//                         size: 18,
//                       ),
//                       Text("5.0")
//                     ],
//                   ),
//                   Text(
//                     "11 month ago",
//                     style: TextStyle(fontSize: 11, color: Colors.grey),
//                   )
//                 ],
//               )
//             ],
//           ),
//           SizedBox(
//             height: 4,
//           ),
//           Text(
//             "${hospitalReviewModelDoc!.review}",
//             style: TextStyle(fontSize: 14, color: Colors.grey),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Row(
//             children: [
//               RatingBar.builder(
//                 itemSize: 16,
//                 initialRating:
//                     (hospitalReviewModelDoc!.rating ?? 0.0) as double,
//                 minRating: 1,
//                 direction: Axis.horizontal,
//                 allowHalfRating: true,
//                 itemCount: 5,
//                 itemPadding: EdgeInsets.symmetric(horizontal: 0),
//                 itemBuilder: (context, _) => Icon(
//                   Icons.star,
//                   color: Colors.blue,
//                 ),
//                 onRatingUpdate: (rating) {
//                   print(rating);
//                 },
//               ),
//               SizedBox(
//                 width: 8,
//               ),
//               Text(
//                 "5.0",
//                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//               )
//             ],
//           ),
//         ],
//       ),
//     );