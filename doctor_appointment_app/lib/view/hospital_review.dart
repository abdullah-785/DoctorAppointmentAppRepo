import 'dart:ffi';

import 'package:doctor_appointment_app/Models/hospital_model.dart';
import 'package:doctor_appointment_app/view_model/hospital_review_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class HospitalReview extends StatefulWidget {
  HospitalReview({super.key, required this.hospitalDoc});
  HospitalModel hospitalDoc;

  @override
  State<HospitalReview> createState() => _HospitalReviewState();
}

class _HospitalReviewState extends State<HospitalReview>
    with TickerProviderStateMixin {
  // List of Tabs

// controller object
  late TabController _tabController;
  final TextEditingController _reviewController = TextEditingController();
  Double? ratingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    final hospitalReview = Provider.of<HospitalReviewViewModel>(context);
    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          Column(
            children: [
              Stack(children: [
                Container(
                    width: width * 1,
                    height: 230,
                    child: Image.network(widget.hospitalDoc.image.toString())),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 16, right: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.white)),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 20,
                          ),
                        ),
                      ),
                      const Spacer(),
                      // const Expanded(
                      //     child: Text(
                      //   textAlign: TextAlign.center,
                      //   "Doctor",
                      //   style:
                      //       TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      // )),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.white)),
                        child: const Icon(
                          Icons.share,
                          size: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.white)),
                        child: const Icon(
                          Icons.favorite_border,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          ),
          ////////////
          ///
          SizedBox(
            height: height * .82,
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  width: width * 1,
                  height: height * 0.82,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0, right: 16, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.hospitalDoc.name}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${widget.hospitalDoc.specializeIn}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 18,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "${widget.hospitalDoc.address}",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_outlined,
                              size: 18,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "15 min, 1.5km, Mon Sun | 11 am - 11pm",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 40,
                        ),

                        /////////////////////////////////////////////////////////////////
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Your overall rating of this hospital",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RatingBar.builder(
                              unratedColor: Colors.grey[350],
                              itemSize: 50,
                              initialRating: 0.0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                hospitalReview.setRating(rating);
                                print(rating);
                                // setState(() {

                                // });
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Add detailed review",
                                  style: TextStyle(),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _reviewController,
                              maxLines: 4,
                              minLines: 4,
                              decoration: InputDecoration(
                                  hintText: "Enter here",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.green.withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(12))),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_border_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        Text(
                          " 4.8 (1k+ Reviews)",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ]),
          )
        ]),
        Container(
          alignment: Alignment.center,
          width: width * 1,
          height: 75,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border.all(color: Colors.grey.withOpacity(.4))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  hospitalReview.createReview(
                      _reviewController.text, widget.hospitalDoc, context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width * .8,
                  height: 40,
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
