import 'package:doctor_appointment_app/resources/components/cancelled_booking_Card.dart';
import 'package:doctor_appointment_app/resources/components/completed_booking.dart';
import 'package:doctor_appointment_app/resources/components/upcomming_booking_card.dart';
import 'package:flutter/material.dart';

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
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BookingCardUpcomming(width: width),
                BookingCardUpcomming(width: width),
                BookingCardUpcomming(width: width),
                BookingCardUpcomming(width: width),
              ],
            ),
          ),

          //Completed
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BookingCardCompleted(width: width),
                BookingCardCompleted(width: width),
                BookingCardCompleted(width: width),
                BookingCardCompleted(width: width),
              ],
            ),
          ),

          //Cancelled

          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BookingCardCancelled(
                  width: width,
                ),
                BookingCardCancelled(
                  width: width,
                ),
                BookingCardCancelled(
                  width: width,
                ),
                BookingCardCancelled(
                  width: width,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
