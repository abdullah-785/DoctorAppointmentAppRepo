import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/booking_model.dart';
import 'package:doctor_appointment_app/resources/components/cancelled_booking_Card.dart';
import 'package:doctor_appointment_app/resources/components/completed_booking.dart';
import 'package:doctor_appointment_app/resources/components/upcomming_booking_card.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

            // automaticallyImplyLeading: false,

            centerTitle: true,
            foregroundColor: Colors.black,
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              "Bookings",
              style: TextStyle(color: Colors.black),
            ),
            bottom: const TabBar(
                labelColor: Colors.grey,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(
                    text: "Upcomming",
                  ),
                  Tab(
                    text: "Completed",
                  ),
                  Tab(
                    text: "Cancelled",
                  ),
                ])),
        body: TabBarView(children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Oppointments')
                .where('status', isEqualTo: 'Upcomming')
                .where('userRef', isEqualTo: 'Users/${Utils.uid}')
                .orderBy('createAt', descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SpinKitCircle(size: 35, color: Colors.blue);
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (!snapshot.hasData) {
                return const Text('No data found');
              }

              final List<BookingModel> booking =
                  snapshot.data!.docs.map((DocumentSnapshot document) {
                return BookingModel.fromMap(
                    document.data() as Map<String, dynamic>);
              }).toList();

              return SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: booking.length,
                  itemBuilder: (context, index) {
                    return BookingCardUpcoming(
                      width: width,
                      bookingDoc: booking[index],
                    );
                  },
                ),
              );
            },
          ),

          //Completed
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Oppointments')
                .where('status', isEqualTo: 'Completed')
                .where('userRef', isEqualTo: 'Users/${Utils.uid}')
                .orderBy('createAt', descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SpinKitCircle(size: 35, color: Colors.blue);
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (!snapshot.hasData) {
                return const Text('No data found');
              }

              final List<BookingModel> booking =
                  snapshot.data!.docs.map((DocumentSnapshot document) {
                return BookingModel.fromMap(
                    document.data() as Map<String, dynamic>);
              }).toList();

              return SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: booking.length,
                  itemBuilder: (context, index) {
                    return BookingCardCompleted(
                      width: width,
                      bookingDoc: booking[index],
                    );
                  },
                ),
              );
            },
          ),

          //Cancelled

          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Oppointments')
                .where('status', isEqualTo: 'Cancelled')
                .where('userRef', isEqualTo: 'Users/${Utils.uid}')
                .orderBy('createAt', descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SpinKitCircle(size: 35, color: Colors.blue);
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (!snapshot.hasData) {
                return const Text('No data found');
              }

              final List<BookingModel> booking =
                  snapshot.data!.docs.map((DocumentSnapshot document) {
                return BookingModel.fromMap(
                    document.data() as Map<String, dynamic>);
              }).toList();

              return SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: booking.length,
                  itemBuilder: (context, index) {
                    return BookingCardCancelled(
                      width: width,
                      bookingDoc: booking[index],
                    );
                  },
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
