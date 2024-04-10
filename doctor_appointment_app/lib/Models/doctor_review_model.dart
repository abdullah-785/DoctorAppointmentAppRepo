import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorReviewModel {
  String? uid;
  double? rating;
  String? review;
  DateTime? createdAt;
  DocumentReference<Map<String, dynamic>>? userRef;
  DocumentReference<Map<String, dynamic>>? doctorRef;

  DoctorReviewModel({
    this.uid,
    this.rating,
    this.review,
    this.createdAt,
    this.userRef,
    this.doctorRef,
  });

  factory DoctorReviewModel.fromMap(Map<String, dynamic> map) {
    return DoctorReviewModel(
      uid: map['uid'] as String?,
      // rating: map['rating'],
      rating: map['rating'] as double?, // Explicitly cast as double?

      review: map['review'],
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
      userRef: FirebaseFirestore.instance.doc(map['userRef']),
      doctorRef: FirebaseFirestore.instance.doc(map['doctorRef']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "rating": rating,
      'review': review,
      "createdAt": createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      "userRef":
          userRef?.path ?? '', // Provide a default value if userRef is null
      "doctorRef": doctorRef?.path ??
          '', // Provide a default value if hospitalRef is null
    };
  }
}
