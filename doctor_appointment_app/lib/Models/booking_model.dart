// import 'package:cloud_firestore/cloud_firestore.dart';

// class DoctorModel {
//   String? uid;
//   String? bookingId;
//   DateTime? date;
//   String? time;
//   String? status;
//   DocumentReference<DoctorModel>? doctorRef;
  
  

//   DoctorModel(
//       {this.uid,
//       this.bookingId,
//       this.date,
//       this.time,
//       this.doctorRef,
      
      
//       });

//   factory DoctorModel.fromMap(map) {
//     return DoctorModel(
//         uid: map['uid'],
//         bookingId: map['bookingId'],
//         date: map['date'],
//         time: map['time'],
//         doctorRef: map['doctorRef'],
        
        
//     );

//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'bookingId': bookingId,
//       'date': date,
//       'time': time,
//       'doctorRef': doctorRef,

      
      
//     };
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  String? uid;
  String? bookingId;
  DateTime? date;
  String? time;
  String? status;
  
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
    
  });

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      uid: map['uid'],
      bookingId: map['bookingId'],
      date: (map['date'] as Timestamp?)?.toDate(), // Convert Timestamp to DateTime
      time: map['time'],
      status: map['status'],
      doctorRef: FirebaseFirestore.instance.doc(map['doctorRef']),
      userRef: FirebaseFirestore.instance.doc(map['userRef']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'bookingId': bookingId,
      'date': date != null ? Timestamp.fromDate(date!) : null, // Convert DateTime to Timestamp
      'time': time,
      'status': status,
      'doctorRef': doctorRef?.path,
      'userRef': userRef?.path,
    };
  }
}
