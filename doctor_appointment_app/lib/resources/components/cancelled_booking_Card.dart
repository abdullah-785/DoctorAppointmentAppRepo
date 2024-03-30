import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/booking_model.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:doctor_appointment_app/view_model/book_oppoint_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class BookingCardCancelled extends StatefulWidget {
  BookingCardCancelled({
    super.key,
    required this.width,
    required this.bookingDoc,
  });

  final double width;
  BookingModel bookingDoc;

  @override
  State<BookingCardCancelled> createState() => _BookingCardCancelledState();
}

class _BookingCardCancelledState extends State<BookingCardCancelled> {
  @override
  Widget build(BuildContext context) {
    final bookOppointmentViewModel =
        Provider.of<BookOppointmentViewModel>(context);
    return FutureBuilder<DoctorModel>(
      future: bookOppointmentViewModel.fetchDoctorDetails(widget.bookingDoc),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While data is loading
          return SpinKitCircle(
            color: Colors.blue,
            size: 30,
          ); // Or any other loading indicator
        } else if (snapshot.hasError) {
          // If there's an error
          return Text('Error: ${snapshot.error}');
        } else {
          // Data has been loaded successfully
          DoctorModel doctorModel = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.only(bottom: 15.0, left: 12, right: 12),
            child: Container(
              width: widget.width * 0.9,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 3),
                        spreadRadius: 5,
                        blurRadius: 40,
                        color: Colors.grey.shade200)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(widget.bookingDoc.date.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black)),
                        Text(" - ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black)),
                        Text(widget.bookingDoc.time.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black)),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey.shade200,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: widget.width * 0.22,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              doctorModel.image.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doctorModel.name.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      doctorModel.address.toString(),
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.amp_stories_outlined,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Booking ID: ",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    Text(
                                      widget.bookingDoc.bookingId.toString(),
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: widget.width * 0.8,
                          height: 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.blue),
                          child: Text(
                            "Re-Book",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<DoctorModel> _fetchDoctorDetails() async {
    DocumentReference? doctorRef = widget.bookingDoc.doctorRef;
    if (doctorRef != null) {
      String doctorId = doctorRef.id; // Extracting the document ID directly
      DocumentSnapshot doctorSnapshot = await FirebaseFirestore.instance
          .collection("Doctor")
          .doc(doctorId)
          .get();
      return DoctorModel.fromMap(doctorSnapshot.data()!);
    } else {
      throw Exception("Doctor reference is null");
    }
  }
}
