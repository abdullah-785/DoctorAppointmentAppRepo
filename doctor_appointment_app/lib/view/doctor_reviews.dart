import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:doctor_appointment_app/view_model/doctor_review_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class DoctorReview extends StatefulWidget {
  DoctorReview({super.key, required this.doctorModel});
  DoctorModel doctorModel;

  @override
  State<DoctorReview> createState() => _DoctorReviewState();
}

class _DoctorReviewState extends State<DoctorReview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    final doctorReviewViewModel = Provider.of<DoctorReviewViewModel>(context);
    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          Column(
            children: [
              Stack(children: [
                Container(
                    width: width * 1,
                    height: 230,
                    child: Image.network(
                      "${widget.doctorModel.image}",
                      fit: BoxFit.cover,
                    )),
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
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  width: width * 1,
                  height: height * 0.82,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 70.0, right: 16, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${widget.doctorModel.name}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 40,
                        ),

                        /////////////////////////////////////////////////////////////////
                        Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Who was your experience with Jonny",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RatingBar.builder(
                              itemSize: 50,
                              initialRating: 0.0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                                doctorReviewViewModel.rating = rating;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Add detailed review",
                                  style: TextStyle(),
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _reviewController,
                              maxLines: 4,
                              minLines: 4,
                              decoration: InputDecoration(
                                  hintText: "Enter here",
                                  border: OutlineInputBorder(
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
                  Stack(alignment: Alignment.bottomRight, children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            widget.doctorModel.image!,
                            fit: BoxFit.cover,
                          )),
                    ),
                    const Icon(Icons.verified, color: Colors.blue, size: 16),
                  ]),
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
                  doctorReviewViewModel.createReview(
                      _reviewController.text, widget.doctorModel, context);
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
