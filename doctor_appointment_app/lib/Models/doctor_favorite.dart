import 'package:cloud_firestore/cloud_firestore.dart';


class DoctorFavoriteModel{
  DateTime? createdAt;
  DocumentReference<Map<String, dynamic>>? userRef;
  DocumentReference<Map<String, dynamic>>? doctorRef;


  DoctorFavoriteModel({
    this.createdAt,
    
    this.userRef,
    this.doctorRef
  });


  factory DoctorFavoriteModel.fromMap(Map<String, dynamic> map){
    return DoctorFavoriteModel(
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ,
      userRef: FirebaseFirestore.instance.doc(map['userRef']),
      doctorRef: FirebaseFirestore.instance.doc(map['doctorRef'])
      
    );
  }


  Map<String, dynamic> toMap(){
    return{
      "createdAt": createdAt != null? Timestamp.fromDate(createdAt!): null,
      "userRef": userRef!.path,
      "doctorRef": doctorRef!.path

    };
  }
  

}