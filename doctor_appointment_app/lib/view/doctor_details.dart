import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:doctor_appointment_app/Models/doctor_review_model.dart';
import 'package:doctor_appointment_app/resources/components/doctor_detail_card.dart';
import 'package:doctor_appointment_app/resources/components/doctor_review_widget.dart';
import 'package:doctor_appointment_app/resources/components/review_widget.dart';
import 'package:doctor_appointment_app/resources/components/working_hours_widget.dart';
import 'package:doctor_appointment_app/view/book_appointment.dart';
import 'package:doctor_appointment_app/view/doctor_reviews.dart';
import 'package:doctor_appointment_app/view_model/doctor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class DoctorDetails extends StatefulWidget {
  DoctorDetails({super.key, required this.doctorDoc});
  DoctorModel? doctorDoc;
  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  Widget build(BuildContext context) {
    final doctorViewModel = Provider.of<DoctorViewModel>(context);
    doctorViewModel.countDocuments(widget.doctorDoc!);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
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
                              border: Border.all(color: Colors.grey)),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 20,
                          ),
                        ),
                      ),
                      const Expanded(
                          child: Text(
                        textAlign: TextAlign.center,
                        "Doctor",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey)),
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
                            border: Border.all(color: Colors.grey)),
                        child: const Icon(
                          Icons.favorite_border,
                          size: 20,
                        ),
                      ),
                    ],
                  ),

                  ///////////////
                  const SizedBox(
                    height: 35,
                  ),

                  Row(
                    children: [
                      Stack(alignment: Alignment.bottomRight, children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                widget.doctorDoc!.image.toString(),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const Icon(
                          Icons.verified,
                          color: Colors.blue,
                        )
                      ]),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.doctorDoc!.name.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            widget.doctorDoc!.specializeIn.toString(),
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                          Row(children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 18,
                              color: Colors.blue,
                            ),
                            Text(
                              widget.doctorDoc!.address.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                              ),
                            ),
                          ]),
                        ],
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(.4),
                  ),
                  /////////////////////////

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DoctorDetailCard(
                        iconData: Icons.group,
                        audience: "${doctorViewModel.patient}+",
                        audienceName: "Patients",
                      ),
                      DoctorDetailCard(
                        iconData: Icons.badge,
                        audience: "10+",
                        audienceName: "Patients",
                      ),
                      DoctorDetailCard(
                        iconData: Icons.star_purple500_rounded,
                        audience: "${doctorViewModel.reviews}+",
                        audienceName: "Reviews",
                      ),
                      DoctorDetailCard(
                        iconData: Icons.message_rounded,
                        audience: "${doctorViewModel.patient}+",
                        audienceName: "Patients",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "About",
                    style: TextStyle(fontSize: 16),
                  ),

                  Text(
                    widget.doctorDoc!.about.toString(),
                    maxLines: 3,
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Working Hours",
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(.2),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  WorkingHoursWidget(
                    day: "Monday",
                    doctorDoc: widget.doctorDoc!,
                  ),
                  WorkingHoursWidget(
                    day: "Tuesday",
                    doctorDoc: widget.doctorDoc!,
                  ),
                  WorkingHoursWidget(
                    day: "Wednessday",
                    doctorDoc: widget.doctorDoc!,
                  ),
                  WorkingHoursWidget(
                    day: "Thursday",
                    doctorDoc: widget.doctorDoc!,
                  ),
                  WorkingHoursWidget(
                    day: "Friday",
                    doctorDoc: widget.doctorDoc!,
                  ),
                  WorkingHoursWidget(day: "Saturday"),
                  WorkingHoursWidget(day: "Sunday"),

                  const SizedBox(
                    height: 20,
                  ),
                  // const Row(
                  //   children: [
                  //     Text(
                  //       "Address",
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  // Expanded(
                  //     child: Align(
                  //         alignment: Alignment.topRight,
                  //         child: Text(
                  //           "View on Map",
                  //           style:
                  //               TextStyle(fontSize: 12, color: Colors.blue),
                  //         )))
                  // ],
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 1,
                  //   height: 2,
                  //   color: Colors.grey[100],
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // Row(children: [
                  //   Icon(
                  //     Icons.location_on_outlined,
                  //     size: 18,
                  //     color: Colors.blue,
                  //   ),
                  //   Expanded(
                  //     child: Text(
                  //       widget.doctorDoc!.address.toString(),
                  //       style: TextStyle(),
                  //     ),
                  //   ),
                  // ]),
                  // const SizedBox(
                  //   height: 5,
                  // ),

                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(5),
                  //   child: Image(
                  //       fit: BoxFit.cover,
                  //       width: MediaQuery.of(context).size.width * 1,
                  //       height: 180,
                  //       image: const AssetImage("images/map.png")),
                  // ),

                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DoctorReview(
                                    doctorModel: widget.doctorDoc!,
                                  )));
                    },
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Reviews",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Icon(
                          Icons.edit_note_outlined,
                          size: 20,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "add review",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.blue),
                            ))
                      ],
                    ),
                  ),

                  // TextFormField(
                  //     style: const TextStyle(fontSize: 12),
                  //     decoration: InputDecoration(
                  //       prefixIcon: const Icon(Icons.search),
                  //       // hintText: "Search",
                  //       label: const Text("Search"),

                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(8)),
                  //     )),

                  //Reviews

                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('DoctorReview')
                          .where('doctorRef',
                              isEqualTo: 'Doctor/${widget.doctorDoc!.uid}')
                          .snapshots(),

                      // .snapshots(),

                      // .where('status',isEqualTo: 'Upcomming')
                      // .orderBy('createAt', descending: true)

                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SpinKitThreeBounce(
                              size: 20, color: Colors.blue);
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (!snapshot.hasData) {
                          return const Text('No data found');
                        }

                        final List<DoctorReviewModel> doctorReviewModel =
                            snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                          return DoctorReviewModel.fromMap(
                              document.data() as Map<String, dynamic>);
                        }).toList();

                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * .32,
                          child: ListView.builder(
                            // scrollDirection:
                            //     Axis.vertical,
                            itemCount: doctorReviewModel.length,
                            itemBuilder: (context, index) {
                              return DoctorReviewWidget(
                                doctorReviewModelDoc: doctorReviewModel[index],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookOppointment(
                              doctorDocument: widget.doctorDoc!,
                            )));
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * .9,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Make Oppointment",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  // Future<int> countDocuments(
  //     String collectionName, DoctorModel doctorDoc) async {
  //   try {
  //     // Get a reference to the collection
  //     CollectionReference collectionRef =
  //         FirebaseFirestore.instance.collection(collectionName);

  //     // Get the documents based on the filter
  //     QuerySnapshot querySnapshot = await collectionRef
  //         .where("doctorRef", isEqualTo: "Doctor/${doctorDoc.uid}")
  //         .get();

  //     // Count the documents
  //     int count = querySnapshot.size;
  //     print("Count is :  ${count}");
  //     return count;
  //   } catch (e) {
  //     print("Error counting documents: $e");
  //     return 0;
  //   }
  // }
}
