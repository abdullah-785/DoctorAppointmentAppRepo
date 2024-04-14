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

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
              "Favorite",
              style: TextStyle(color: Colors.black),
            ),
            bottom: const TabBar(
                labelColor: Colors.grey,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(
                    text: "Doctors",
                  ),
                  Tab(
                    text: "Hospitals",
                  ),
                ])),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TabBarView(children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Favorite')
                        .where('userRef', isEqualTo: 'Users/${Utils.uid}')
                        .snapshots(),
                    // .snapshots(),

                    // .where('status',isEqualTo: 'Upcomming')
                    // .orderBy('createAt', descending: true)

                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SpinKitThreeBounce(size: 20, color: Colors.blue);
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (!snapshot.hasData) {
                        return const Text('No data found');
                      }

                      final List<DoctorFavoriteModel> doctorFavorite =
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        return DoctorFavoriteModel.fromMap(
                            document.data() as Map<String, dynamic>);
                      }).toList();

                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 1,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: doctorFavorite.length,
                          itemBuilder: (context, index) {
                            return FavoriteSpecialistCard(
                                width: width,
                                favoriteDoc: doctorFavorite[index]);
                          },
                        ),
                      );
                    },
                  ),
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
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('FavoriteHospital')
                        .where('userRef', isEqualTo: 'Users/${Utils.uid}')
                        .snapshots(),
                    // .where('userRef', isEqualTo: 'Users/${Utils.uid}')

                    // .snapshots(),

                    // .where('status',isEqualTo: 'Upcomming')
                    // .orderBy('createAt', descending: true)

                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SpinKitThreeBounce(size: 25, color: Colors.blue);
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (!snapshot.hasData) {
                        return const Text('No data found');
                      }

                      final List<HospitalFavoriteModel> hospitalFavorite =
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        return HospitalFavoriteModel.fromMap(
                            document.data() as Map<String, dynamic>);
                      }).toList();

                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 1,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: hospitalFavorite.length,
                          itemBuilder: (context, index) {
                            return FavoriteHospitalCard(
                              widthParam: width * 1,
                              hospitalFavDoc: hospitalFavorite[index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 16.0),
                  //   child: HospitalCard(
                  //     widthParam: width * 1,
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 16.0),
                  //   child: HospitalCard(
                  //     widthParam: width * 1,
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 16.0),
                  //   child: HospitalCard(
                  //     widthParam: width * 1,
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 16.0),
                  //   child: HospitalCard(
                  //     widthParam: width * 1,
                  //   ),
                  // ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
