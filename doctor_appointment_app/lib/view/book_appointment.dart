
import 'package:doctor_appointment_app/resources/components/booking_date.dart';
import 'package:doctor_appointment_app/resources/components/booking_time.dart';
import 'package:doctor_appointment_app/resources/components/doctor_detail_card.dart';
import 'package:flutter/material.dart';

class BookOppointment extends StatefulWidget {
  const BookOppointment({super.key});

  @override
  State<BookOppointment> createState() => _BookOppointmentState();
}

class _BookOppointmentState extends State<BookOppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey)),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 20,
                          ),
                        ),
                      ),
                      const Expanded(
                          child: Text(
                        textAlign: TextAlign.center,
                        "Doctor",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey)),
                        child: const Icon(
                          Icons.share,
                          size: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey)),
                        child: const Icon(
                          Icons.favorite_border,
                          size: 20,
                        ),
                      ),
                    ],
                  ),

                  ///////////////
                  const SizedBox(
                    height: 35,
                  ),

                  Row(
                    children: [
                      Stack(alignment: Alignment.bottomRight, children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: const Image(
                                image: AssetImage("images/doctor1.jpg"),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const Icon(
                          Icons.verified,
                          color: Colors.blue,
                        )
                      ]),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Dr. Jonny Wilson",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Dentist",
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                          const Row(children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 18,
                              color: Colors.blue,
                            ),
                            Text(
                              "New York, United States",
                            ),
                          ]),
                        ],
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(.4),
                  ),
                  /////////////////////////

                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DoctorDetailCard(
                        iconData: Icons.group,
                        audience: "7500+",
                        audienceName: "Patients",
                      ),
                      DoctorDetailCard(
                        iconData: Icons.badge,
                        audience: "10+",
                        audienceName: "Patients",
                      ),
                      DoctorDetailCard(
                        iconData: Icons.star_purple500_rounded,
                        audience: "4.9+",
                        audienceName: "Patients",
                      ),
                      DoctorDetailCard(
                        iconData: Icons.message_rounded,
                        audience: "4956+",
                        audienceName: "Patients",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Book Appointment",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const Text(
                    "Day",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BookingDayWidget(
                          col: Colors.blue,
                          borderColor: Colors.blue,
                          textColor: Colors.white,
                          day: "Today",
                          date: "25 Dec",
                        ),
                        BookingDayWidget(
                          col: Colors.white,
                          borderColor: Color.fromARGB(226, 158, 158, 158),
                          textColor: Colors.grey,
                          day: "Tuesday",
                          date: "26 Dec",
                        ),
                        BookingDayWidget(
                          col: Colors.white,
                          borderColor: Color.fromARGB(226, 158, 158, 158),
                          textColor: Colors.grey,
                          day: "Wednesday",
                          date: "27 Dec",
                        ),
                        BookingDayWidget(
                          col: Colors.white,
                          borderColor: Color.fromARGB(226, 158, 158, 158),
                          textColor: Colors.grey,
                          day: "Thursday",
                          date: "28 Dec",
                        ),
                        BookingDayWidget(
                          col: Colors.white,
                          borderColor: Color.fromARGB(226, 158, 158, 158),
                          textColor: Colors.grey,
                          day: "Friday",
                          date: "29 Dec",
                        ),
                        BookingDayWidget(
                          col: Colors.white,
                          borderColor: Color.fromARGB(226, 158, 158, 158),
                          textColor: Colors.grey,
                          day: "Saturday",
                          date: "30 Dec",
                        ),
                        BookingDayWidget(
                          col: Colors.white,
                          borderColor: Color.fromARGB(226, 158, 158, 158),
                          textColor: Colors.grey,
                          day: "Sunday",
                          date: "31 Dec",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const Text(
                    "Date",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BookingTime(
                          col: Colors.blue,
                          borderColor: Colors.blue,
                          textColor: Colors.white,
                          time: "7:00 PM",
                        ),
                        BookingTime(
                          col: Colors.white,
                          borderColor: Color.fromARGB(226, 158, 158, 158),
                          textColor: Colors.grey,
                          time: "8:00 Pm",
                        ),
                        BookingTime(
                          col: Colors.white,
                          borderColor: Color.fromARGB(226, 158, 158, 158),
                          textColor: Colors.grey,
                          time: "9:00 Pm",
                        ),
                        BookingTime(
                          col: Colors.white,
                          borderColor: Color.fromARGB(226, 158, 158, 158),
                          textColor: Colors.grey,
                          time: "10:00 Pm",
                        ),
                        BookingTime(
                          col: Colors.white,
                          borderColor: Color.fromARGB(226, 158, 158, 158),
                          textColor: Colors.grey,
                          time: "11:00 Pm",
                        ),
                        BookingTime(
                          col: Colors.white,
                          borderColor: Color.fromARGB(226, 158, 158, 158),
                          textColor: Colors.grey,
                          time: "12:00 AM",
                        ),
                      ],
                    ),
                  ),

                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.9,
                  //   height: 30,
                  //   child: Row(children: [
                  //     Text("data")
                  //   ],),
                  // )
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                          suffix: const Text("Request Schedule"),
                          suffixStyle:
                              const TextStyle(color: Colors.blue, fontSize: 12),
                          hintText: "Want a custom shedule?",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * .9,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "Book Oppointment",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ]),
          ),
        )));
  }
}
