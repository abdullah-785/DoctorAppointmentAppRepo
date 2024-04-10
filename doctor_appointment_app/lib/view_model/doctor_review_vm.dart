import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:doctor_appointment_app/Models/doctor_review_model.dart';
import 'package:doctor_appointment_app/Models/hospital_model.dart';
import 'package:doctor_appointment_app/Models/hospital_review.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DoctorReviewViewModel with ChangeNotifier {
  double rating = 0.0;

  setRating(value) {
    rating = value;
    notifyListeners();
  }

  Future<void> createReview(
    String review,
    DoctorModel doctorModel,
    BuildContext context,
  ) async {
    try {
      print("Rating is : $rating");
      DoctorReviewModel doctorReview = DoctorReviewModel(
        rating: rating,
        review: review,
        doctorRef: FirebaseFirestore.instance
            .collection("Doctor")
            .doc(doctorModel.uid),
        userRef: FirebaseFirestore.instance.collection("Users").doc(Utils.uid),
        createdAt: DateTime.now(),
      );

      Map<String, dynamic> reviewMap = doctorReview.toMap();

      DocumentReference docRef = await FirebaseFirestore.instance
          .collection("DoctorReview")
          .add(reviewMap);

      await docRef.update({"uid": docRef.id});
      Navigator.pop(context);
    } catch (e) {
      Utils.FlushBarErrorMessage(e.toString(), context);
    }
  }

  Future<UserModel> getUser(DoctorReviewModel doctorReviewDoc) async {
    DocumentReference<Map<String, dynamic>>? userRef = doctorReviewDoc.userRef;

    if (userRef != null) {
      String userReff = userRef.id;
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(userReff)
          .get();

      return UserModel.fromMap(documentSnapshot.data());
    } else {
      throw Exception("Null");
    }
  }
}
