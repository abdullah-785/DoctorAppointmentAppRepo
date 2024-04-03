import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:doctor_appointment_app/Models/hospital_model.dart';
import 'package:doctor_appointment_app/Models/hospital_review.dart';
import 'package:doctor_appointment_app/resources/components/review_widget.dart';
import 'package:doctor_appointment_app/resources/components/specialist_card.dart';
import 'package:doctor_appointment_app/resources/components/working_hours_widget.dart';
import 'package:doctor_appointment_app/view/hospital_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HospitalDetails extends StatefulWidget {
  HospitalDetails({super.key, required this.hospitalDoc});

  HospitalModel hospitalDoc;

  @override
  State<HospitalDetails> createState() => _HospitalDetailsState();
}

class _HospitalDetailsState extends State<HospitalDetails>
    with TickerProviderStateMixin {
  // List of Tabs

// controller object
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          Column(
            children: [
              Stack(children: [
                Container(
                  width: width * 1,
                  height: 250,
                  child: Image.network(
                    widget.hospitalDoc.image.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0, left: 16, right: 16),
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
                    padding:
                        const EdgeInsets.only(top: 30.0, right: 16, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.hospitalDoc.name.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Text(
                          widget.hospitalDoc.specializeIn.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Icon(
                                Icons.location_on_outlined,
                                size: 18,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                widget.hospitalDoc.address.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                            ),
                          ],
                        ),

                        const Row(
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

                        const SizedBox(
                          height: 20,
                        ),

                        ////////////////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                    width: 45,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 219, 234, 254),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.web_stories_rounded,
                                        size: 22,
                                        color: Colors.blue,
                                      ),
                                    )),
                                const Text(
                                  "Website",
                                  style: TextStyle(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    width: 45,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 219, 234, 254),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.message,
                                        size: 21,
                                        color: Colors.blue,
                                      ),
                                    )),
                                const Text(
                                  "Message",
                                  style: TextStyle(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    width: 45,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 219, 234, 254),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.call,
                                        size: 20,
                                        color: Colors.blue,
                                      ),
                                    )),
                                const Text(
                                  "Call",
                                  style: TextStyle(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    width: 45,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 219, 234, 254),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.location_on_sharp,
                                        size: 24,
                                        color: Colors.blue,
                                      ),
                                    )),
                                const Text(
                                  "Direction",
                                  style: TextStyle(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    width: 45,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 219, 234, 254),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.near_me,
                                        size: 24,
                                        color: Colors.blue,
                                      ),
                                    )),
                                const Text(
                                  "Share",
                                  style: TextStyle(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        Container(
                            width: width * 1,
                            height: height * 0.48,
                            // color: Colors.black,
                            child: DefaultTabController(
                                length: 4,
                                child: Column(
                                  children: [
                                    TabBar(
                                      // isScrollable: true,
                                      controller: _tabController,
                                      tabs: [
                                        const Tab(text: 'Specialist'),
                                        const Tab(text: 'Gallery'),
                                        const Tab(text: 'Review'),
                                        const Tab(text: 'About'),
                                      ],
                                      labelPadding: const EdgeInsets.only(
                                          right: 6, left: 6, top: 0, bottom: 0),
                                      indicatorColor: Colors
                                          .blue, // Customize the indicator color
                                      labelColor: Colors
                                          .blue, // Customize the selected tab text color
                                      unselectedLabelColor: Colors
                                          .grey, // Customize the unselected tab text color
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _tabController,
                                        children: [
                                          StreamBuilder<QuerySnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection('Doctor')
                                                .snapshots(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<QuerySnapshot>
                                                    snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return SpinKitThreeBounce(
                                                  color: Colors.blue,
                                                  size: 25,
                                                );
                                              }
                                              if (snapshot.hasError) {
                                                return Text(
                                                    'Error: ${snapshot.error}');
                                              }

                                              if (!snapshot.hasData) {
                                                return const Text(
                                                    'No data found');
                                              }

                                              final List<DoctorModel> doctor =
                                                  snapshot.data!.docs.map(
                                                      (DocumentSnapshot
                                                          document) {
                                                return DoctorModel.fromMap(
                                                    document.data() as Map<
                                                        String, dynamic>);
                                              }).toList();

                                              return ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: doctor.length,
                                                itemBuilder: (context, index) {
                                                  return SpecialistCard(
                                                    width: width,
                                                    doctorDoc: doctor[index],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          GridView.count(
                                            primary: false,
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            crossAxisCount: 2,
                                            children: <Widget>[
                                              Container(
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: const Image(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            "images/hospital1.jpg"))),
                                              ),
                                              Container(
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: const Image(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            "images/hospital1.jpg"))),
                                              ),
                                              Container(
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: const Image(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            "images/hospital1.jpg"))),
                                              ),
                                              Container(
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: const Image(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            "images/hospital1.jpg"))),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20.0),
                                            child: StreamBuilder<QuerySnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection('HospitalReview')
                                                  .where('hospitalRef',
                                                      isEqualTo:
                                                          'Hospital/${widget.hospitalDoc.uid}')
                                                  .snapshots(),

                                              // .snapshots(),

                                              // .where('status',isEqualTo: 'Upcomming')
                                              // .orderBy('createAt', descending: true)

                                              builder: (BuildContext context,
                                                  AsyncSnapshot<QuerySnapshot>
                                                      snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return SpinKitThreeBounce(
                                                      size: 20,
                                                      color: Colors.blue);
                                                }
                                                if (snapshot.hasError) {
                                                  return Text(
                                                      'Error: ${snapshot.error}');
                                                }

                                                if (!snapshot.hasData) {
                                                  return const Text(
                                                      'No data found');
                                                }

                                                final List<HospitalReviewModel>
                                                    hospitalReviewModel =
                                                    snapshot.data!.docs.map(
                                                        (DocumentSnapshot
                                                            document) {
                                                  return HospitalReviewModel
                                                      .fromMap(document.data()
                                                          as Map<String,
                                                              dynamic>);
                                                }).toList();

                                                return SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      1,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      1,
                                                  child: ListView.builder(
                                                    // scrollDirection:
                                                    //     Axis.vertical,
                                                    itemCount:
                                                        hospitalReviewModel
                                                            .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return ReviewWidget(
                                                        hospitalReviewModelDoc:
                                                            hospitalReviewModel[
                                                                index],
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "About",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Text(
                                                "${widget.hospitalDoc.description ?? "Description"}",
                                                maxLines: 3,
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                "Working Hours",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Divider(
                                                color:
                                                    Colors.grey.withOpacity(.2),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const WorkingHoursWidget(
                                                  day: "Monday"),
                                              const WorkingHoursWidget(
                                                  day: "Tuesday"),
                                              const WorkingHoursWidget(
                                                  day: "Wednessday"),
                                              const WorkingHoursWidget(
                                                  day: "Thursday"),
                                              const WorkingHoursWidget(
                                                  day: "Friday"),
                                              const WorkingHoursWidget(
                                                  day: "Saturday"),
                                              const WorkingHoursWidget(
                                                  day: "Sunday"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )))
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
                    child: Row(
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
                          // "${countHospitalReviews(
                          //   widget.hospitalDoc,
                          // )}",
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
              borderRadius: BorderRadius.only(
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HospitalReview(
                                hospitalDoc: widget.hospitalDoc,
                              )));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width * .8,
                  height: 40,
                  child: Text(
                    "Add Review",
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

  int countHospitalReviews(
      HospitalModel hospital, List<HospitalReviewModel> allReviews) {
    // Filter the allReviews list based on the hospital's UID
    List<HospitalReviewModel> specificHospitalReviews = allReviews
        .where((review) => review.hospitalRef == hospital.uid)
        .toList();

    // Count the number of reviews for the specific hospital
    int specificHospitalReviewCount = specificHospitalReviews.length;

    return specificHospitalReviewCount;
  }
}
