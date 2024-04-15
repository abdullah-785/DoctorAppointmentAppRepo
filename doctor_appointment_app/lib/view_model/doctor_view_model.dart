import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/doctor_favorite.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:flutter/material.dart';

class DoctorViewModel with ChangeNotifier {
  // int patient = 0;
  // int recover = 0;
  // int reviews = 0;
  // int chat = 0;

  // Future<void> countDocuments(DoctorModel doctorDoc) async {
  //   try {
  //     // Get a reference to the collection of Oppointment
  //     CollectionReference oppointmentCollectionRef =
  //         FirebaseFirestore.instance.collection("Oppointments");

  //     CollectionReference reviewCollectionRef =
  //         FirebaseFirestore.instance.collection("DoctorReview");

  //     // Get the documents based on the filter
  //     QuerySnapshot oppointQuerySnapshot = await oppointmentCollectionRef
  //         .where("doctorRef", isEqualTo: "Doctor/${doctorDoc.uid}")
  //         .get();

  //     //count the recovered patients means that which oppointments that have status = Completed
  //     QuerySnapshot recoverQuerySnapshot = await oppointmentCollectionRef
  //         .where("doctorRef", isEqualTo: "Doctor/${doctorDoc.uid}")
  //         .where("status", isEqualTo: "Completed")
  //         .get();

  //     //review query snapshot
  //     QuerySnapshot reviewQuerySnapshot = await reviewCollectionRef
  //         .where("doctorRef", isEqualTo: "Doctor/${doctorDoc.uid}")
  //         .get();

  //     // Count the documents
  //     // int oppointCount = oppointQuerySnapshot.size;
  //     // int reviewCont = reviewQuerySnapshot.size;

  //     patient = oppointQuerySnapshot.size;
  //     recover = recoverQuerySnapshot.size;
  //     reviews = reviewQuerySnapshot.size;
  //   } catch (e) {
  //     print("Error counting documents: $e");
  //   }
  // }
}
