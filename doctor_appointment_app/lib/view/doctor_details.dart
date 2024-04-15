import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:doctor_appointment_app/Models/doctor_review_model.dart';
import 'package:doctor_appointment_app/resources/components/doctor_detail_card.dart';
import 'package:doctor_appointment_app/resources/components/doctor_review_widget.dart';
import 'package:doctor_appointment_app/resources/components/review_widget.dart';
import 'package:doctor_appointment_app/resources/components/working_hours_widget.dart';
import 'package:doctor_appointment_app/view/book_appointment.dart';
import 'package:doctor_appointment_app/view/doctor_reviews.dart';
import 'package:doctor_appointment_app/view/favorite.dart';
import 'package:doctor_appointment_app/view_model/doctor_favorite_vm.dart';
import 'package:doctor_appointment_app/view_model/doctor_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DoctorDetails extends StatefulWidget {
  DoctorDetails({super.key, required this.doctorDoc});
  DoctorModel? doctorDoc;
  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  int patient = 0;
  int recover = 0;
  int reviews = 0;

  @override
  void initState() {
    super.initState();
    countDocuments(widget.doctorDoc!);
    // print("Date is : ${widget.doctorDocument.availabilityTimeTo}");
  }

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = Provider.of<DoctorFavoriteViewModel>(context);

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
                      GestureDetector(
                        onTap: () {
                          Share.share("${widget.doctorDoc!.name}",
                              subject: "${widget.doctorDoc!.about}");
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey)),
                          child: Icon(
                            Icons.share,
                            // color: Colors.grey[500],
                            size: 20,
                          ),
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
                        child: StreamBuilder<bool>(
                          stream: favoriteViewModel.CheckLikedOrNot(
                              widget.doctorDoc!),
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
                                  ? GestureDetector(
                                      onTap: () async {
                                        favoriteViewModel.doctorLiked(
                                          widget.doctorDoc!,
                                          context,
                                        );
                                      },
                                      child: Icon(
                                        Icons.favorite_border_rounded,
                                        // color: Colors.grey[500],
                                        size: 20,
                                      ),
                                    )
                                  : GestureDetector(
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
                                        color: Colors.blue,
                                        size: 20,
                                      ));
                            }
                          },
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
                            child: CachedNetworkImage(
                              imageUrl: widget.doctorDoc!.image.toString(),
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
                            // Image.network(
                            //   widget.doctorDoc!.image.toString(),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
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
                        audience: "${patient}",
                        audienceName: "Patients",
                      ),
                      DoctorDetailCard(
                        iconData: Icons.badge,
                        audience: "${recover}",
                        audienceName: "Recover",
                      ),
                      DoctorDetailCard(
                        iconData: Icons.star_purple500_rounded,
                        audience: "${reviews}",
                        audienceName: "Reviews",
                      ),
                      DoctorDetailCard(
                        iconData: Icons.message_rounded,
                        audience: "${patient}",
                        audienceName: "Chats",
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

  Future<void> countDocuments(DoctorModel doctorDoc) async {
    try {
      // Get a reference to the collection of Oppointment
      CollectionReference oppointmentCollectionRef =
          FirebaseFirestore.instance.collection("Oppointments");

      CollectionReference reviewCollectionRef =
          FirebaseFirestore.instance.collection("DoctorReview");

      // Get the documents based on the filter
      QuerySnapshot oppointQuerySnapshot = await oppointmentCollectionRef
          .where("doctorRef", isEqualTo: "Doctor/${doctorDoc.uid}")
          .get();

      //count the recovered patients means that which oppointments that have status = Completed
      QuerySnapshot recoverQuerySnapshot = await oppointmentCollectionRef
          .where("doctorRef", isEqualTo: "Doctor/${doctorDoc.uid}")
          .where("status", isEqualTo: "Completed")
          .get();

      //review query snapshot
      QuerySnapshot reviewQuerySnapshot = await reviewCollectionRef
          .where("doctorRef", isEqualTo: "Doctor/${doctorDoc.uid}")
          .get();

      // Count the documents
      // int oppointCount = oppointQuerySnapshot.size;
      // int reviewCont = reviewQuerySnapshot.size;
      setState(() {
        patient = oppointQuerySnapshot.size;
        recover = recoverQuerySnapshot.size;
        reviews = reviewQuerySnapshot.size;
      });
    } catch (e) {
      print("Error counting documents: $e");
    }
  }
}
