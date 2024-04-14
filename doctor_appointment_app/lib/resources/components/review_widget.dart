import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/hospital_review.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:doctor_appointment_app/view_model/hospital_review_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
// import 'package:relative_time/relative_time.dart';

class ReviewWidget extends StatefulWidget {
  ReviewWidget({
    super.key,
    this.hospitalReviewModelDoc,
  });
  HospitalReviewModel? hospitalReviewModelDoc;

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  //  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    // final ttime = DateTime.now();
    // setState(() {

    // });

    final hospitalReviewViewModel =
        Provider.of<HospitalReviewViewModel>(context);
    return FutureBuilder<UserModel>(
        future: hospitalReviewViewModel.getUser(widget.hospitalReviewModelDoc!),
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
                      Column(
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
                              Text(
                                  "${widget.hospitalReviewModelDoc!.rating ?? 0.0}")
                            ],
                          ),
                          // Text(
                          //   widget.hospitalReviewModelDoc != null &&
                          //           widget.hospitalReviewModelDoc!.createdAt !=
                          //               null
                          //       ? RelativeTime(context).format(
                          //           widget.hospitalReviewModelDoc!.createdAt!)
                          //       : 'Unknown',
                          //   style: TextStyle(fontSize: 11, color: Colors.grey),
                          // )

                          Text(
                            "${widget.hospitalReviewModelDoc!.createdAt!.year}",
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
                    "${widget.hospitalReviewModelDoc!.review}",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        itemSize: 16,
                        initialRating: (widget.hospitalReviewModelDoc!.rating ??
                            0.0) as double,
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
                    ],
                  ),
                ],
              ),
            );
          }
        });
  }
}
