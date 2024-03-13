import 'package:doctor_appointment_app/Models/booking_model.dart';
import 'package:flutter/material.dart';

class BookingCardUpcomming extends StatefulWidget {
  BookingCardUpcomming({
    super.key,
    required this.width,
    required this.bookingDoc,
  });

  BookingModel bookingDoc;

  final double width;

  @override
  State<BookingCardUpcomming> createState() => _BookingCardUpcommingState();
}

class _BookingCardUpcommingState extends State<BookingCardUpcomming> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
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
                  color: Colors.grey.shade200)
            ]),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(widget.bookingDoc.date.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black)),
                  Text(" - ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black)),
                  Text(widget.bookingDoc.time.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black)),
                ],
              ),
              SizedBox(
                height: 5,
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
                    width: widget.width * 0.25,
                    height: 100,
                    child: Image(
                      image: AssetImage("images/doctor1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. Jenny William",
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
                                "G8502 Preston Rd, Inglewood",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
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
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              Text(
                                widget.bookingDoc.bookingId.toString(),
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
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
                    width: 120,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue[100]),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue),
                    child: Text(
                      "Reschedule",
                      style: TextStyle(color: Colors.white),
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

  String formatDate(DateTime dT) {
    DateTime now = dT;
    DateTime dateOnly = DateTime(now.year, now.month, now.day);
    return dateOnly.toString();
// This will print the date part only, with time set to 00:00:00
  }
}
