import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:doctor_appointment_app/Models/hospital_model.dart';
import 'package:doctor_appointment_app/resources/components/hospital_card.dart';
import 'package:doctor_appointment_app/resources/components/specialist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AllDoctorHospital extends StatefulWidget {
  const AllDoctorHospital(
      {super.key, required this.title, required this.isHospital, this.type});

  final String title;
  final bool isHospital;
  final String? type;

  @override
  State<AllDoctorHospital> createState() => _AllDoctorHospitalState();
}

class _AllDoctorHospitalState extends State<AllDoctorHospital> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          widget.isHospital
              ? StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Hospital')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SpinKitCircle(size: 35, color: Colors.blue);
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
                      height: MediaQuery.of(context).size.height * .88,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: hospital.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            // restaurants[index].name.toString()
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, bottom: 12),
                              child: HospitalCard(
                                widthParam:
                                    MediaQuery.of(context).size.width * 1,
                                hospitalModel: hospital[index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                )
              : StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Doctor')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SpinKitCircle(size: 35, color: Colors.blue);
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

                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * .88,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: doctor.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12, top: 10),
                            child: SpecialistCard(
                              width: width,
                              doctorDoc: doctor[index],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
