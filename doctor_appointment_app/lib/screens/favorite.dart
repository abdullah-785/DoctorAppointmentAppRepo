import 'package:doctor_appointment_app/Widgets/hospital_card.dart';
import 'package:doctor_appointment_app/Widgets/specialist_card.dart';
import 'package:flutter/material.dart';

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
                  SpecialistCard(
                    width: width,
                  ),
                  SpecialistCard(
                    width: width,
                  ),
                  SpecialistCard(
                    width: width,
                  ),
                  SpecialistCard(
                    width: width,
                  ),
                ],
              ),
            ),

            //Hospitals

            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: HospitalCard(
                      widthParam: width * 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: HospitalCard(
                      widthParam: width * 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: HospitalCard(
                      widthParam: width * 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: HospitalCard(
                      widthParam: width * 1,
                    ),
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
