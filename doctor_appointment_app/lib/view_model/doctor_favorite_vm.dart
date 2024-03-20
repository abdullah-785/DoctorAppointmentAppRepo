import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/doctor_favorite.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:flutter/material.dart';

class DoctorFavoriteViewModel with ChangeNotifier {
  Future<void> doctorLiked(DoctorModel doctorDoc, BuildContext context) async {
    try {
      DoctorFavoriteModel doctorFavoriteModel = DoctorFavoriteModel(
      createdAt: DateTime.now(),
      userRef: FirebaseFirestore.instance.collection("Users").doc(Utils.uid),
      doctorRef:
          FirebaseFirestore.instance.collection("Doctor").doc(doctorDoc.uid),
    );

    Map<String, dynamic> doctorMap = doctorFavoriteModel.toMap();
    DocumentReference ref =
        await FirebaseFirestore.instance.collection("Favorite").add(doctorMap);

    await ref.update({"uid": ref.id});
      
    } catch (e) {
      Utils.FlushBarErrorMessage(e.toString(), context);
      
    }
  }
}
