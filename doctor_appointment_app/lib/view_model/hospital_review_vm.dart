import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/hospital_model.dart';
import 'package:doctor_appointment_app/Models/hospital_review.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HospitalReviewViewModel with ChangeNotifier {
  // Future<void> createReview(String review, HospitalModel hospitalModel,
  //     double? rating, BuildContext context) async {
  //   try {
  //     HospitalReviewModel hospitalReview = HospitalReviewModel(
  //       rating: rating,
  //       review: review,
  //       hospitalRef: FirebaseFirestore.instance
  //           .collection("Hospital")
  //           .doc(hospitalModel.uid),
  //       userRef: FirebaseFirestore.instance.collection("Users").doc(Utils.uid),
  //       createdAt: DateTime.now(),
  //     );

  //     Map<String, dynamic> reviewMap = hospitalReview.toMap();

  //     DocumentReference docRef = await FirebaseFirestore.instance
  //         .collection("HospitalReview")
  //         .add(reviewMap);

  //     await docRef.update({"uid": docRef.id});
  //     Navigator.pop(context);
  //   } catch (e) {
  //     Utils.FlushBarErrorMessage(e.toString(), context);
  //   }
  // }
  double rating = 0.0;

  setRating(value) {
    rating = value;
    notifyListeners();
  }

  Future<void> createReview(
    String review,
    HospitalModel hospitalModel,
    BuildContext context,
  ) async {
    try {
      print("Rating is : $rating");
      HospitalReviewModel hospitalReview = HospitalReviewModel(
        rating: rating,
        review: review,
        hospitalRef: FirebaseFirestore.instance
            .collection("Hospital")
            .doc(hospitalModel.uid),
        userRef: FirebaseFirestore.instance.collection("Users").doc(Utils.uid),
        createdAt: DateTime.now(),
      );

      Map<String, dynamic> reviewMap = hospitalReview.toMap();

      DocumentReference docRef = await FirebaseFirestore.instance
          .collection("HospitalReview")
          .add(reviewMap);

      await docRef.update({"uid": docRef.id});
      Navigator.pop(context);
    } catch (e) {
      Utils.FlushBarErrorMessage(e.toString(), context);
    }
  }

  Future<UserModel> getUser(HospitalReviewModel hospitalReviewDoc) async {
    DocumentReference<Map<String, dynamic>>? userRef =
        hospitalReviewDoc.userRef;

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
