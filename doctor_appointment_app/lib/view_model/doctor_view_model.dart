import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:flutter/material.dart';

class DoctorViewModel with ChangeNotifier {
  int patient = 0;
  int reviews = 0;
  int chat = 0;
  // setPatient(value) {
  //   patient = value;
  //   notifyListeners();
  // }

  // setReview(value) {
  //   reviews = value;
  //   notifyListeners();
  // }

  // setChat(value) {
  //   chat = value;
  //   notifyListeners();
  // }

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

      //review query snapshot
      QuerySnapshot reviewQuerySnapshot = await reviewCollectionRef
          .where("doctorRef", isEqualTo: "Doctor/${doctorDoc.uid}")
          .get();

      // Count the documents
      int oppointCount = oppointQuerySnapshot.size;
      int reviewCont = reviewQuerySnapshot.size;
      print("Count is :  ${count}");
      patient = oppointCount;
      // setPatient(oppointCount);
      // setReview(reviewCont);
      // setChat(oppointCount);
      reviews = reviewCont;
    } catch (e) {
      print("Error counting documents: $e");
    }
  }
}
