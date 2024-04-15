import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_appointment_app/view_model/book_oppoint_view_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/booking_model.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class BookingCardUpcoming extends StatefulWidget {
  final double width;
  final BookingModel bookingDoc;

  const BookingCardUpcoming({
    Key? key,
    required this.width,
    required this.bookingDoc,
  }) : super(key: key);

  @override
  State<BookingCardUpcoming> createState() => _BookingCardUpcomingState();
}

class _BookingCardUpcomingState extends State<BookingCardUpcoming> {
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
            padding: EdgeInsets.only(bottom: 15.0, left: 12, right: 12),
            child: Container(
              width: widget.width * 0.9,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3),
                    spreadRadius: 5,
                    blurRadius: 40,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.bookingDoc.date.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          " - ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          widget.bookingDoc.time.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Divider(
                      height: 1,
                      color: Colors.grey.shade200,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: widget.width * 0.22,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              imageUrl: doctorModel.image.toString(),
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
                            //   doctorModel.image.toString(),
                            //   fit: BoxFit.cover,
                            // ),
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
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      doctorModel.address.toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.amp_stories_outlined,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Booking ID: ",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      widget.bookingDoc.bookingId.toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
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
                        InkWell(
                          onTap: () {
                            // Update the status to "Cancelled"
                            FirebaseFirestore.instance
                                .collection("Oppointments")
                                .doc(widget.bookingDoc
                                    .uid) // Assuming bookingId is the document ID
                                .update({"status": "Cancelled"}).then((_) {
                              // Successfully updated the status
                              print("Status updated to Cancelled");
                            }).catchError((error) {
                              // Failed to update the status
                              print("Failed to update status: $error");
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 120,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.blue[100],
                            ),
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.blue,
                          ),
                          child: Text(
                            "Reschedule",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
