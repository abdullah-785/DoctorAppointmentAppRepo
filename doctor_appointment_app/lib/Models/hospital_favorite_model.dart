import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalFavoriteModel {
  DateTime? createdAt;
  String? uid;
  DocumentReference<Map<String, dynamic>>? userRef;
  DocumentReference<Map<String, dynamic>>? hospitalRef;

  HospitalFavoriteModel({
    this.createdAt,
    this.uid,
    this.userRef,
    this.hospitalRef,
  });

  factory HospitalFavoriteModel.fromMap(Map<String, dynamic> map) {
    return HospitalFavoriteModel(
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
      uid: map['uid'] as String?,
      userRef: FirebaseFirestore.instance.doc(map['userRef']),
      hospitalRef: FirebaseFirestore.instance.doc(map['hospitalRef']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "createdAt": createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      "uid": uid,
      "userRef":
          userRef?.path ?? '', // Provide a default value if userRef is null
      "hospitalRef": hospitalRef?.path ??
          '', // Provide a default value if hospitalRef is null
    };
  }
}
