import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/booking_model.dart';
import 'package:doctor_appointment_app/Models/doctor_favorite.dart';
import 'package:doctor_appointment_app/Models/hospital_favorite_model.dart';
import 'package:doctor_appointment_app/resources/components/favorite_hospital.dart';
import 'package:doctor_appointment_app/resources/components/favorite_specialist_card.dart';
import 'package:doctor_appointment_app/resources/components/hospital_card.dart';
import 'package:doctor_appointment_app/resources/components/specialist_card.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            // automaticallyImplyLeading: false,
            centerTitle: true,
            foregroundColor: Colors.black,
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              "Help Center",
              style: TextStyle(color: Colors.black),
            ),
            bottom: const TabBar(
                labelColor: Colors.grey,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(
                    text: "FAQ's",
                  ),
                  Tab(
                    text: "Contact",
                  ),
                ])),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TabBarView(children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ExpansionTile(
                    // leading: Icon(Icons.info_outline),
                    title: Text('ExpansionTile 1'),
                    subtitle: Text('Trailing expansion arrow icon'),
                    children: <Widget>[
                      ListTile(title: Text('This is tile number 1')),
                    ],
                  ),

                  ExpansionTile(
                    // leading: Icon(Icons.info_outline),
                    title: Text('ExpansionTile 1'),
                    subtitle: Text('Trailing expansion arrow icon'),
                    children: <Widget>[
                      ListTile(title: Text('This is tile number 1')),
                    ],
                  ),

                  ExpansionTile(
                    // leading: Icon(Icons.info_outline),
                    title: Text('ExpansionTile 1'),
                    subtitle: Text('Trailing expansion arrow icon'),
                    children: <Widget>[
                      ListTile(title: Text('This is tile number 1')),
                    ],
                  ),
                  // StreamBuilder<QuerySnapshot>(
                  //   stream: FirebaseFirestore.instance
                  //       .collection('Favorite')
                  //       .where('userRef', isEqualTo: 'Users/${Utils.uid}')
                  //       .snapshots(),
                  //   // .snapshots(),

                  //   // .where('status',isEqualTo: 'Upcomming')
                  //   // .orderBy('createAt', descending: true)

                  //   builder: (BuildContext context,
                  //       AsyncSnapshot<QuerySnapshot> snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return SpinKitCircle(size: 35, color: Colors.blue);
                  //     }
                  //     if (snapshot.hasError) {
                  //       return Text('Error: ${snapshot.error}');
                  //     }

                  //     if (!snapshot.hasData) {
                  //       return const Text('No data found');
                  //     }

                  //     final List<DoctorFavoriteModel> doctorFavorite =
                  //         snapshot.data!.docs.map((DocumentSnapshot document) {
                  //       return DoctorFavoriteModel.fromMap(
                  //           document.data() as Map<String, dynamic>);
                  //     }).toList();

                  //     return SizedBox(
                  //       width: MediaQuery.of(context).size.width * 1,
                  //       height: MediaQuery.of(context).size.height * 1,
                  //       child: ListView.builder(
                  //         scrollDirection: Axis.vertical,
                  //         itemCount: doctorFavorite.length,
                  //         itemBuilder: (context, index) {
                  //           return FavoriteSpecialistCard(
                  //               width: width,
                  //               favoriteDoc: doctorFavorite[index]);
                  //         },
                  //       ),
                  //     );
                  //   },
                  // ),
                  // SpecialistCard(
                  //   width: width,
                  // ),
                  // SpecialistCard(
                  //   width: width,
                  // ),
                  // SpecialistCard(
                  //   width: width,
                  // ),
                  // SpecialistCard(
                  //   width: width,
                  // ),
                ],
              ),
            ),

            //Hospitals

            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Subject",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 56,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: 0, bottom: 0, left: 16),
                        hintText: "Enter Subject",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.black54, width: .4)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black54, width: .4),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 56,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: 0, bottom: 0, left: 16),
                        hintText: "Enter Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.black54, width: .4)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black54, width: .4),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Message",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    maxLines: 8,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: 16, bottom: 16, left: 16),
                      hintText: "Message",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.black54, width: .4)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black54, width: .4),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: width * 1,
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onPressed: () async {},
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
