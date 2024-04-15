import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:doctor_appointment_app/resources/components/booking_date.dart';
import 'package:doctor_appointment_app/resources/components/booking_time.dart';
import 'package:doctor_appointment_app/resources/components/doctor_detail_card.dart';
import 'package:doctor_appointment_app/view/favorite.dart';
import 'package:doctor_appointment_app/view_model/book_oppoint_view_model.dart';
import 'package:doctor_appointment_app/view_model/doctor_favorite_vm.dart';
import 'package:doctor_appointment_app/view_model/doctor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class BookOppointment extends StatefulWidget {
  BookOppointment({super.key, required this.doctorDocument});
  DoctorModel doctorDocument;

  @override
  State<BookOppointment> createState() => _BookOppointmentState();
}

class _BookOppointmentState extends State<BookOppointment> {
  int patient = 0;
  int recover = 0;
  int reviews = 0;

  @override
  void initState() {
    super.initState();
    countDocuments(widget.doctorDocument);
    // print("Date is : ${widget.doctorDocument.availabilityTimeTo}");
  }

  @override
  Widget build(BuildContext context) {
    final bookOppointmentViewModel =
        Provider.of<BookOppointmentViewModel>(context);

    // final doctorViewModel = Provider.of<DoctorViewModel>(context);
    // doctorViewModel.countDocuments(widget.doctorDocument!);
    final favoriteViewModel = Provider.of<DoctorFavoriteViewModel>(context);
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
                      GestureDetector(
                        onTap: () {
                          Share.share("${widget.doctorDocument.name}",
                              subject: "${widget.doctorDocument.about}");
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey)),
                          child: Icon(
                            Icons.share,
                            // color: Colors.grey[500],
                            size: 20,
                          ),
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
                        child: StreamBuilder<bool>(
                          stream: favoriteViewModel.CheckLikedOrNot(
                              widget.doctorDocument),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SpinKitThreeBounce(
                                color: Colors.blue,
                                size: 10,
                              );
                            } else if (snapshot.hasError) {
                              return Text("Error ${snapshot.error}");
                            } else {
                              return snapshot.data == false
                                  ? GestureDetector(
                                      onTap: () async {
                                        favoriteViewModel.doctorLiked(
                                          widget.doctorDocument,
                                          context,
                                        );
                                      },
                                      child: Icon(
                                        Icons.favorite_border_rounded,
                                        // color: Colors.grey[500],
                                        size: 20,
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                FavoriteScreen(),
                                          ),
                                        );
                                        // favoriteViewModel.deleteFavoriteDoctor(favoriteDoc)
                                      },
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.blue,
                                        size: 20,
                                      ));
                            }
                          },
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
                            child: CachedNetworkImage(
                              imageUrl: widget.doctorDocument.image.toString(),
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
                          ),
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
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                              ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DoctorDetailCard(
                        iconData: Icons.group,
                        audience: "${patient}",
                        audienceName: "Patients",
                      ),
                      DoctorDetailCard(
                        iconData: Icons.badge,
                        audience: "${recover}",
                        audienceName: "Recover",
                      ),
                      DoctorDetailCard(
                        iconData: Icons.star_purple500_rounded,
                        audience: "${reviews}",
                        audienceName: "Reviews",
                      ),
                      DoctorDetailCard(
                        iconData: Icons.message_rounded,
                        audience: "${patient}",
                        audienceName: "Chats",
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

                        final slots = bookOppointmentViewModel
                            .slotsBWOpeningAndClosingTime(
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
                    future: Future.value(
                        bookOppointmentViewModel.slotsBWOpeningAndClosingTime(
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
                  // Container(
                  //   child: TextFormField(
                  //     autofocus: false,
                  //     decoration: InputDecoration(
                  //         suffix: const Text("Request Schedule"),
                  //         suffixStyle:
                  //             const TextStyle(color: Colors.blue, fontSize: 12),
                  //         hintText: "Want a custom shedule?",
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20))),
                  //   ),
                  // ),

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

  Future<void> countDocuments(DoctorModel doctorDoc) async {
    try {
      // Get a reference to the collection of Oppointment
      CollectionReference oppointmentCollectionRef =
          FirebaseFirestore.instance.collection("Oppointments");

      CollectionReference reviewCollectionRef =
          FirebaseFirestore.instance.collection("DoctorReview");

      // Get the documents based on the filter
      QuerySnapshot oppointQuerySnapshot = await oppointmentCollectionRef
          .where("doctorRef", isEqualTo: "Doctor/${doctorDoc.uid}")
          .get();

      //count the recovered patients means that which oppointments that have status = Completed
      QuerySnapshot recoverQuerySnapshot = await oppointmentCollectionRef
          .where("doctorRef", isEqualTo: "Doctor/${doctorDoc.uid}")
          .where("status", isEqualTo: "Completed")
          .get();

      //review query snapshot
      QuerySnapshot reviewQuerySnapshot = await reviewCollectionRef
          .where("doctorRef", isEqualTo: "Doctor/${doctorDoc.uid}")
          .get();

      // Count the documents
      // int oppointCount = oppointQuerySnapshot.size;
      // int reviewCont = reviewQuerySnapshot.size;
      setState(() {
        patient = oppointQuerySnapshot.size;
        recover = recoverQuerySnapshot.size;
        reviews = reviewQuerySnapshot.size;
      });
    } catch (e) {
      print("Error counting documents: $e");
    }
  }
}
