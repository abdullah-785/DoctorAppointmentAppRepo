import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  String? uid;
  String? bookingId;
  String? date;
  String? time;
  String? status;
  DateTime? createAt;
  
  DocumentReference<Map<String, dynamic>>? doctorRef;
  DocumentReference<Map<String, dynamic>>? userRef;

  BookingModel({
    this.uid,
    this.bookingId,
    this.date,
    this.time,
    this.status,
    this.doctorRef,
    this.userRef,
    this.createAt,
    
  });

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      uid: map['uid'],
      bookingId: map['bookingId'],
      date: map['date'], // Convert Timestamp to DateTime
      time: map['time'],
      status: map['status'],
      doctorRef: FirebaseFirestore.instance.doc(map['doctorRef']),
      userRef: FirebaseFirestore.instance.doc(map['userRef']),
      createAt: (map['createAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'bookingId': bookingId,
      'date': date, // Convert DateTime to Timestamp
      'time': time,
      'status': status,
      'doctorRef': doctorRef?.path,
      'userRef': userRef?.path,
      'createAt': createAt != null? Timestamp.fromDate(createAt!): null
    };
  }
}
