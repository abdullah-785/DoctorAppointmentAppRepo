import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalReviewModel {
  String? uid;
  Double? rating;
  String? review;
  DateTime? createdAt;
  DocumentReference<Map<String, dynamic>>? userRef;
  DocumentReference<Map<String, dynamic>>? hospitalRef;

  HospitalReviewModel({
    this.uid,
    this.rating,
    this.review,
    this.createdAt,
    this.userRef,
    this.hospitalRef,
  });

  factory HospitalReviewModel.fromMap(Map<String, dynamic> map) {
    return HospitalReviewModel(
      uid: map['uid'] as String?,
      rating: map['rating'],
      review: map['review'],
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
      userRef: FirebaseFirestore.instance.doc(map['userRef']),
      hospitalRef: FirebaseFirestore.instance.doc(map['hospitalRef']),
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
      "hospitalRef": hospitalRef?.path ??
          '', // Provide a default value if hospitalRef is null
    };
  }
}
