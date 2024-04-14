import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:doctor_appointment_app/resources/components/booking_date.dart';
import 'package:doctor_appointment_app/resources/components/booking_time.dart';
import 'package:doctor_appointment_app/resources/components/doctor_detail_card.dart';
import 'package:doctor_appointment_app/view_model/book_oppoint_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookOppointment extends StatefulWidget {
  BookOppointment({super.key, required this.doctorDocument});
  DoctorModel doctorDocument;

  @override
  State<BookOppointment> createState() => _BookOppointmentState();
}

class _BookOppointmentState extends State<BookOppointment> {
  @override
  void initState() {
    super.initState();

    // print("Date is : ${widget.doctorDocument.availabilityTimeTo}");
  }

  @override
  Widget build(BuildContext context) {
    final bookOppointmentViewModel =
        Provider.of<BookOppointmentViewModel>(context);
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
                              child: Image(
                                image: NetworkImage(
                                    widget.doctorDocument.image.toString()),
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
                          Text(
                            widget.doctorDocument.name.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            widget.doctorDocument.specializeIn.toString(),
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                          Row(children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 18,
                              color: Colors.blue,
                            ),
                            Text(
                              widget.doctorDocument.address.toString(),
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
                    "Select Oppointment Date",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.blue,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        bookOppointmentViewModel.setDateTime(date);

                        final slots = slotsBWOpeningAndClosingTime(
                            widget.doctorDocument.availabilityTimeTo!,
                            widget.doctorDocument.availabilityTimeFrom!,
                            60);
                        print(slots);
                      });
                    },
                  ),

                  // CalendarDatePicker(
                  //   initialDate: DateTime.now().add(Duration(days: 1)),
                  //   firstDate: DateTime.now().add(Duration(days: 1)),
                  //   lastDate: DateTime(2030),
                  //   onDateChanged: (DateTime selectedDate) {
                  //     // Your logic when the date is changedgenerateTimeSlots
                  //     // print(widget.doctorDocument.availabilityTimeTo!);
                  //     bookOppointmentViewModel.setDateTime(selectedDate);
                  //     final slots = slotsBWOpeningAndClosingTime(
                  //         widget.doctorDocument.availabilityTimeTo!,
                  //         widget.doctorDocument.availabilityTimeFrom!,
                  //         60);
                  //     print(slots);
                  //     ////////
                  //   },
                  // ),

                  // }),

                  const SizedBox(
                    height: 40,
                  ),

                  const Text(
                    "Select Oppointment Slot",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder<List<DateTime>>(
                    future: Future.value(slotsBWOpeningAndClosingTime(
                      widget.doctorDocument.availabilityTimeTo!,
                      widget.doctorDocument.availabilityTimeFrom!,
                      60, // Slot duration in minutes
                    )),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SpinKitThreeBounce(
                          color: Colors.blue,
                          size: 15,
                        );
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else {
                        // Handle the case where data is available
                        List<DateTime> slots = snapshot.data ?? [];
                        return SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 1,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            // shrinkWrap: true,
                            itemCount: slots.length,
                            itemBuilder: (context, index) {
                              DateTime slot = slots[index];
                              String formattedSlot =
                                  DateFormat('hh:mm a').format(slot);
                              return GestureDetector(
                                onTap: () {
                                  bookOppointmentViewModel
                                      .setSlot("${formattedSlot}");
                                },
                                child: BookingTime(
                                  col: bookOppointmentViewModel.slot ==
                                          "${formattedSlot}"
                                      ? Colors.blue
                                      : Colors.white,
                                  borderColor: bookOppointmentViewModel.slot ==
                                          "${formattedSlot}"
                                      ? Colors.blue
                                      : Color.fromARGB(226, 158, 158, 158),
                                  textColor: bookOppointmentViewModel.slot ==
                                          formattedSlot
                                      ? Colors.white
                                      : Colors.grey,
                                  time: formattedSlot,
                                ),
                              );

                              // Text(formattedSlot);
                            },
                          ),
                        );
                      }
                    },
                  ),

                  const SizedBox(
                    height: 50,
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
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: InkWell(
                      onTap: () {
                        bookOppointmentViewModel.bookOppointment(
                            widget.doctorDocument.uid.toString(), context);
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * .9,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(20)),
                          child: bookOppointmentViewModel.isLoading == false
                              ? Text(
                                  "Book Oppointment",
                                  style: TextStyle(color: Colors.white),
                                )
                              : SpinKitCircle(size: 35, color: Colors.white)),
                    ),
                  ),
                ]),
          ),
        )));
  }

  List<DateTime> slotsBWOpeningAndClosingTime(
    DateTime opening,
    DateTime closing,
    int slotDuration,
  ) {
    /// MODIFY CODE ONLY BELOW THIS LINE

    List<DateTime> slots = [];
    int slotDurationInMinutes = slotDuration ?? 60;
    DateTime currentSlot = DateTime(
      opening.year,
      opening.month,
      opening.day,
      opening.hour,
      opening.minute,
    );

    while (currentSlot.isBefore(closing) || currentSlot == closing) {
      slots.add(currentSlot);
      currentSlot = currentSlot.add(Duration(minutes: slotDurationInMinutes));
    }
    final now = DateTime.now();
    return slots.where((dateTime) => dateTime.isAfter(now)).toList();

    /// MODIFY CODE ONLY ABOVE THIS LINE
  }
}





// SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {
                  //           bookOppointmentViewModel.setSlot("10:00 am");
                  //         },
                  //         child: BookingTime(
                  //           col: bookOppointmentViewModel.slot == "10:00 am"
                  //               ? Colors.blue
                  //               : Colors.white,
                  //           borderColor:
                  //               bookOppointmentViewModel.slot == "10:00 am"
                  //                   ? Colors.blue
                  //                   : Color.fromARGB(226, 158, 158, 158),
                  //           textColor:
                  //               bookOppointmentViewModel.slot == "10:00 am"
                  //                   ? Colors.white
                  //                   : Colors.grey,
                  //           time: "10:00 am",
                  //         ),
                  //       ),
                  //       // InkWell(
                  //       //   onTap: () {
                  //       //     bookOppointmentViewModel.setSlot("11:00 am");
                  //       //   },
                  //       //   child: BookingTime(
                  //       //     col: bookOppointmentViewModel.slot == "11:00 am"
                  //       //         ? Colors.blue
                  //       //         : Colors.white,
                  //       //     borderColor:
                  //       //         bookOppointmentViewModel.slot == "11:00 am"
                  //       //             ? Colors.blue
                  //       //             : Color.fromARGB(226, 158, 158, 158),
                  //       //     textColor:
                  //       //         bookOppointmentViewModel.slot == "11:00 am"
                  //       //             ? Colors.white
                  //       //             : Colors.grey,
                  //       //     time: "11:00 am",
                  //       //   ),
                  //       // ),
                  //       // InkWell(
                  //       //   onTap: () {
                  //       //     bookOppointmentViewModel.setSlot("12:00 pm");
                  //       //   },
                  //       //   child: BookingTime(
                  //       //     col: bookOppointmentViewModel.slot == "12:00 pm"
                  //       //         ? Colors.blue
                  //       //         : Colors.white,
                  //       //     borderColor:
                  //       //         bookOppointmentViewModel.slot == "12:00 pm"
                  //       //             ? Colors.blue
                  //       //             : Color.fromARGB(226, 158, 158, 158),
                  //       //     textColor:
                  //       //         bookOppointmentViewModel.slot == "12:00 pm"
                  //       //             ? Colors.white
                  //       //             : Colors.grey,
                  //       //     time: "12:00 pm",
                  //       //   ),
                  //       // ),
                  //       // InkWell(
                  //       //   onTap: () {
                  //       //     bookOppointmentViewModel.setSlot("01:00 pm");
                  //       //   },
                  //       //   child: BookingTime(
                  //       //     col: bookOppointmentViewModel.slot == "01:00 pm"
                  //       //         ? Colors.blue
                  //       //         : Colors.white,
                  //       //     borderColor:
                  //       //         bookOppointmentViewModel.slot == "01:00 pm"
                  //       //             ? Colors.blue
                  //       //             : Color.fromARGB(226, 158, 158, 158),
                  //       //     textColor:
                  //       //         bookOppointmentViewModel.slot == "01:00 pm"
                  //       //             ? Colors.white
                  //       //             : Colors.grey,
                  //       //     time: "01:00 pm",
                  //       //   ),
                  //       // ),
                  //       // InkWell(
                  //       //   onTap: () {
                  //       //     bookOppointmentViewModel.setSlot("02:00 pm");
                  //       //   },
                  //       //   child: BookingTime(
                  //       //     col: bookOppointmentViewModel.slot == "02:00 pm"
                  //       //         ? Colors.blue
                  //       //         : Colors.white,
                  //       //     borderColor:
                  //       //         bookOppointmentViewModel.slot == "02:00 pm"
                  //       //             ? Colors.blue
                  //       //             : Color.fromARGB(226, 158, 158, 158),
                  //       //     textColor:
                  //       //         bookOppointmentViewModel.slot == "02:00 pm"
                  //       //             ? Colors.white
                  //       //             : Colors.grey,
                  //       //     time: "02:00 pm",
                  //       //   ),
                  //       // ),
                  //       // InkWell(
                  //       //   onTap: () {
                  //       //     bookOppointmentViewModel.setSlot("03:00 pm");
                  //       //   },
                  //       //   child: BookingTime(
                  //       //     col: bookOppointmentViewModel.slot == "03:00 pm"
                  //       //         ? Colors.blue
                  //       //         : Colors.white,
                  //       //     borderColor:
                  //       //         bookOppointmentViewModel.slot == "03:00 pm"
                  //       //             ? Colors.blue
                  //       //             : Color.fromARGB(226, 158, 158, 158),
                  //       //     textColor:
                  //       //         bookOppointmentViewModel.slot == "03:00 pm"
                  //       //             ? Colors.white
                  //       //             : Colors.grey,
                  //       //     time: "03:00 pm",
                  //       //   ),
                  //       // ),
                  //       // InkWell(
                  //       //   onTap: () {
                  //       //     bookOppointmentViewModel.setSlot("04:00 pm");
                  //       //   },
                  //       //   child: BookingTime(
                  //       //     col: bookOppointmentViewModel.slot == "04:00 pm"
                  //       //         ? Colors.blue
                  //       //         : Colors.white,
                  //       //     borderColor:
                  //       //         bookOppointmentViewModel.slot == "04:00 pm"
                  //       //             ? Colors.blue
                  //       //             : Color.fromARGB(226, 158, 158, 158),
                  //       //     textColor:
                  //       //         bookOppointmentViewModel.slot == "04:00 pm"
                  //       //             ? Colors.white
                  //       //             : Colors.grey,
                  //       //     time: "04:00 pm",
                  //       //   ),
                  //       // ),
                  //       // InkWell(
                  //       //   onTap: () {
                  //       //     bookOppointmentViewModel.setSlot("05:00 pm");
                  //       //   },
                  //       //   child: BookingTime(
                  //       //     col: bookOppointmentViewModel.slot == "05:00 pm"
                  //       //         ? Colors.blue
                  //       //         : Colors.white,
                  //       //     borderColor:
                  //       //         bookOppointmentViewModel.slot == "05:00 pm"
                  //       //             ? Colors.blue
                  //       //             : Color.fromARGB(226, 158, 158, 158),
                  //       //     textColor:
                  //       //         bookOppointmentViewModel.slot == "05:00 pm"
                  //       //             ? Colors.white
                  //       //             : Colors.grey,
                  //       //     time: "05:00 pm",
                  //       //   ),
                  //       // ),
                  //       // InkWell(
                  //       //   onTap: () {
                  //       //     bookOppointmentViewModel.setSlot("06:00 pm");
                  //       //   },
                  //       //   child: BookingTime(
                  //       //     col: bookOppointmentViewModel.slot == "06:00 pm"
                  //       //         ? Colors.blue
                  //       //         : Colors.white,
                  //       //     borderColor:
                  //       //         bookOppointmentViewModel.slot == "06:00 pm"
                  //       //             ? Colors.blue
                  //       //             : Color.fromARGB(226, 158, 158, 158),
                  //       //     textColor:
                  //       //         bookOppointmentViewModel.slot == "06:00 pm"
                  //       //             ? Colors.white
                  //       //             : Colors.grey,
                  //       //     time: "06:00 pm",
                  //       //   ),
                  //       // ),
                  //       // InkWell(
                  //       //   onTap: () {
                  //       //     bookOppointmentViewModel.setSlot("07:00 pm");
                  //       //   },
                  //       //   child: BookingTime(
                  //       //     col: bookOppointmentViewModel.slot == "07:00 pm"
                  //       //         ? Colors.blue
                  //       //         : Colors.white,
                  //       //     borderColor:
                  //       //         bookOppointmentViewModel.slot == "07:00 pm"
                  //       //             ? Colors.blue
                  //       //             : Color.fromARGB(226, 158, 158, 158),
                  //       //     textColor:
                  //       //         bookOppointmentViewModel.slot == "07:00 pm"
                  //       //             ? Colors.white
                  //       //             : Colors.grey,
                  //       //     time: "07:00 pm",
                  //       //   ),
                  //       // ),
                  //       // InkWell(
                  //       //   onTap: () {
                  //       //     bookOppointmentViewModel.setSlot("08:00 pm");
                  //       //   },
                  //       //   child: BookingTime(
                  //       //     col: bookOppointmentViewModel.slot == "08:00 pm"
                  //       //         ? Colors.blue
                  //       //         : Colors.white,
                  //       //     borderColor:
                  //       //         bookOppointmentViewModel.slot == "08:00 pm"
                  //       //             ? Colors.blue
                  //       //             : Color.fromARGB(226, 158, 158, 158),
                  //       //     textColor:
                  //       //         bookOppointmentViewModel.slot == "08:00 pm"
                  //       //             ? Colors.white
                  //       //             : Colors.grey,
                  //       //     time: "08:00 pm",
                  //       //   ),
                  //       // ),
                  //       // InkWell(
                  //       //   onTap: () {
                  //       //     bookOppointmentViewModel.setSlot("09:00 pm");
                  //       //   },
                  //       //   child: BookingTime(
                  //       //     col: bookOppointmentViewModel.slot == "09:00 pm"
                  //       //         ? Colors.blue
                  //       //         : Colors.white,
                  //       //     borderColor:
                  //       //         bookOppointmentViewModel.slot == "09:00 pm"
                  //       //             ? Colors.blue
                  //       //             : Color.fromARGB(226, 158, 158, 158),
                  //       //     textColor:
                  //       //         bookOppointmentViewModel.slot == "09:00 pm"
                  //       //             ? Colors.white
                  //       //             : Colors.grey,
                  //       //     time: "09:00 pm",
                  //       //   ),
                  //       // ),
                  //       // InkWell(
                  //       //   onTap: () {
                  //       //     bookOppointmentViewModel.setSlot("10:00 pm");
                  //       //   },
                  //       //   child: BookingTime(
                  //       //     col: bookOppointmentViewModel.slot == "10:00 pm"
                  //       //         ? Colors.blue
                  //       //         : Colors.white,
                  //       //     borderColor:
                  //       //         bookOppointmentViewModel.slot == "10:00 pm"
                  //       //             ? Colors.blue
                  //       //             : Color.fromARGB(226, 158, 158, 158),
                  //       //     textColor:
                  //       //         bookOppointmentViewModel.slot == "10:00 pm"
                  //       //             ? Colors.white
                  //       //             : Colors.grey,
                  //       //     time: "10:00 pm",
                  //       //   ),
                  //       // ),
                  //       // InkWell(
                  //       //   onTap: () {
                  //       //     bookOppointmentViewModel.setSlot("11:00 pm");
                  //       //   },
                  //       //   child: BookingTime(
                  //       //     col: bookOppointmentViewModel.slot == "11:00 pm"
                  //       //         ? Colors.blue
                  //       //         : Colors.white,
                  //       //     borderColor:
                  //       //         bookOppointmentViewModel.slot == "11:00 pm"
                  //       //             ? Colors.blue
                  //       //             : Color.fromARGB(226, 158, 158, 158),
                  //       //     textColor:
                  //       //         bookOppointmentViewModel.slot == "11:00 pm"
                  //       //             ? Colors.white
                  //       //             : Colors.grey,
                  //       //     time: "11:00 pm",
                  //       //   ),
                  //       // ),
                  //     ],
                  //   ),
                  // ),
