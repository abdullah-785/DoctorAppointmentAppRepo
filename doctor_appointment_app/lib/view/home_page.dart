import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:doctor_appointment_app/Models/hospital_model.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:doctor_appointment_app/resources/components/hospital_card.dart';
import 'package:doctor_appointment_app/resources/components/specialist_card.dart';
import 'package:doctor_appointment_app/view/Booking.dart';
import 'package:doctor_appointment_app/view/all_hospital_doctor.dart';
import 'package:doctor_appointment_app/view/favorite.dart';
import 'package:doctor_appointment_app/view/onboarding/onboarding.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("London"),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.blue,
                            ),
                            Text(
                              "New York, USA",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.3)),
                      child: const Icon(Icons.notifications_none),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      // hintText: "Search",
                      label: const Text("Search"),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    )),
                const SizedBox(
                  height: 20,
                ),
                // Row(
                //   children: [
                //     const Text(
                //       "Upcomming Schedule",
                //       style: TextStyle(fontSize: 18),
                //     ),
                //     const SizedBox(
                //       width: 5,
                //     ),
                //     Container(
                //       alignment: Alignment.center,
                //       decoration: const BoxDecoration(
                //           color: Colors.blue, shape: BoxShape.circle),
                //       width: 20,
                //       height: 20,
                //       child: const Text(
                //         "8",
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //     Expanded(
                //         child: Align(
                //             alignment: Alignment.topRight,
                //             child: InkWell(
                //               onTap: () {
                //                 Navigator.push(
                //                     context,
                //                     MaterialPageRoute(
                //                         builder: ((context) => Bookings())));
                //               },
                //               child: Text(
                //                 "See All",
                //                 style:
                //                     TextStyle(fontSize: 12, color: Colors.blue),
                //               ),
                //             )))
                //   ],
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // Container(
                //   width: width * 1,
                //   height: 130,
                //   decoration: BoxDecoration(
                //       color: Colors.blue, borderRadius: BorderRadius.circular(8)),
                //   child: Padding(
                //     padding: const EdgeInsets.all(12.0),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Row(
                //           children: [
                //             Container(
                //               width: 45,
                //               height: 45,
                //               decoration: const BoxDecoration(
                //                   shape: BoxShape.circle, color: Colors.white),
                //               child: ClipRRect(
                //                 borderRadius: BorderRadius.circular(50),
                //                 child: const Image(
                //                     fit: BoxFit.cover,
                //                     image: AssetImage("images/2.png")),
                //               ),
                //             ),
                //             const SizedBox(
                //               width: 8,
                //             ),
                //             const Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   "Dr.Alana Rueter",
                //                   style: TextStyle(
                //                       fontSize: 16,
                //                       color: Colors.white,
                //                       fontWeight: FontWeight.w500),
                //                 ),
                //                 Text(
                //                   "Dentist Consultation",
                //                   style: TextStyle(
                //                       fontSize: 12, color: Colors.white),
                //                 )
                //               ],
                //             ),
                //             const Spacer(),
                //             Container(
                //               alignment: Alignment.center,
                //               width: 30,
                //               height: 30,
                //               decoration: const BoxDecoration(
                //                   shape: BoxShape.circle, color: Colors.white),
                //               child: const Padding(
                //                 padding: EdgeInsets.all(0),
                //                 child: Icon(
                //                   Icons.call,
                //                   color: Colors.blue,
                //                   size: 20,
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //         Container(
                //           decoration: BoxDecoration(
                //               color: Colors.blue[700],
                //               borderRadius: BorderRadius.circular(5)),
                //           child: Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 const Row(
                //                   children: [
                //                     Icon(
                //                       Icons.calendar_month,
                //                       color: Colors.white,
                //                     ),
                //                     SizedBox(
                //                       width: 4,
                //                     ),
                //                     Text(
                //                       "Monday, 26 July",
                //                       style: TextStyle(color: Colors.white),
                //                     ),
                //                   ],
                //                 ),
                //                 Container(
                //                   width: 1,
                //                   height: 20,
                //                   color: Colors.white.withOpacity(0.6),
                //                 ),
                //                 const Row(
                //                   children: [
                //                     Icon(
                //                       Icons.access_time,
                //                       color: Colors.white,
                //                     ),
                //                     SizedBox(
                //                       width: 4,
                //                     ),
                //                     Text(
                //                       "Monday, 26 July",
                //                       style: TextStyle(color: Colors.white),
                //                     ),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                Row(
                  children: [
                    Text(
                      "Doctor Speciality",
                      style: TextStyle(fontSize: 18),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AllDoctorHospital(
                                            title: "Doctors",
                                            isHospital: false)));
                              },
                              child: Text(
                                "See All",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.blue),
                              ),
                            )))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //////////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllDoctorHospital(
                                        title: "Doctors", isHospital: false)));
                          },
                          child: Container(
                              width: 55,
                              height: 55,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 219, 234, 254),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.blue,
                                ),
                              )),
                        ),
                        const Text(
                          "Dentist",
                          style: TextStyle(
                            fontSize: 14,
                            // fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllDoctorHospital(
                                        title: "Doctors", isHospital: false)));
                          },
                          child: Container(
                              width: 55,
                              height: 55,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 219, 234, 254),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(14.0),
                                child: Icon(
                                  Icons.medical_services_rounded,
                                  color: Colors.blue,
                                ),
                              )),
                        ),
                        const Text(
                          "Cardiologist",
                          style: TextStyle(
                            fontSize: 13,
                            // fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllDoctorHospital(
                                        title: "Doctors", isHospital: false)));
                          },
                          child: Container(
                              width: 55,
                              height: 55,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 219, 234, 254),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(14.0),
                                child: Icon(
                                  Icons.earbuds,
                                  color: Colors.blue,
                                ),
                              )),
                        ),
                        const Text(
                          "Orthopnea",
                          style: TextStyle(
                            fontSize: 13,
                            // fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllDoctorHospital(
                                        title: "Doctors", isHospital: false)));
                          },
                          child: Container(
                              width: 55,
                              height: 55,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 219, 234, 254),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(14.0),
                                child: Icon(
                                  Icons.wifi_tethering_error_rounded_sharp,
                                  color: Colors.blue,
                                ),
                              )),
                        ),
                        const Text(
                          "Neurologist",
                          style: TextStyle(
                            fontSize: 13,
                            // fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Nearby Hospitals",
                      style: TextStyle(fontSize: 18),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AllDoctorHospital(
                                              title: 'Hospital',
                                              isHospital: true,
                                            )));
                              },
                              child: Text(
                                "See All",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.blue),
                              ),
                            )))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),

                ////////////////////
                ///Where condition ==> .where('A', isEqualTo: "B")
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Hospital')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SpinKitThreeBounce(
                        color: Colors.blue,
                        size: 25,
                      );
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (!snapshot.hasData) {
                      return const Text('No data found');
                    }

                    final List<HospitalModel> hospital =
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      return HospitalModel.fromMap(
                          document.data() as Map<String, dynamic>);
                    }).toList();

                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: hospital.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            // restaurants[index].name.toString()
                            child: HospitalCard(
                              widthParam: 240,
                              hospitalModel: hospital[index],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Top Specialist",
                      style: TextStyle(fontSize: 18),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AllDoctorHospital(
                                            title: "Doctors",
                                            isHospital: false)));
                              },
                              child: Text(
                                "See All",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.blue),
                              ),
                            )))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 320,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Doctor')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SpinKitThreeBounce(
                          color: Colors.blue,
                          size: 25,
                        );
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (!snapshot.hasData) {
                        return const Text('No data found');
                      }

                      final List<DoctorModel> doctor =
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        return DoctorModel.fromMap(
                            document.data() as Map<String, dynamic>);
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
                ),
                // SpecialistCard(width: width),
                // SpecialistCard(width: width),
                // SpecialistCard(width: width),
                // SpecialistCard(width: width),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: _bottomNavBarForCurrentPage(),
    );
  }
  // Widget _bottomNavBarForCurrentPage() {
  //   // Check the current page and decide whether to show the bottom navigation bar
  //   if (_selectedIndex == 0 || _selectedIndex == 1) {
  //     return NavBar(
  //       selectedIndex: _selectedIndex,
  //       onTabChange: (index) {
  //         setState(() {
  //           _selectedIndex = index;
  //         });
  //       },
  //     );
  //   } else {
  //     // For pages where you don't want to show the bottom navigation bar, return an empty container
  //     return SizedBox.shrink();
  //   }
  // }
}

List<Widget> _widgetOptions = [
  HomePage(),
  FavoriteScreen(),
  Text(
    'Search',
    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
  ),
  Text(
    'Profile',
    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
  ),
  OnBoarding1(),
];
