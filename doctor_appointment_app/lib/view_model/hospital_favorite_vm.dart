import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/doctor_favorite.dart';
import 'package:doctor_appointment_app/Models/hospital_favorite_model.dart';
import 'package:doctor_appointment_app/Models/hospital_model.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:flutter/material.dart';

class HospitalFavoriteViewModel with ChangeNotifier {
  Future<void> hospitalLiked(
      HospitalModel hospitalDoc, BuildContext context) async {
    try {
      HospitalFavoriteModel hospitalFavoriteModel = HospitalFavoriteModel(
        createdAt: DateTime.now(),
        userRef: FirebaseFirestore.instance.collection("Users").doc(Utils.uid),
        hospitalRef: FirebaseFirestore.instance
            .collection("Hospital")
            .doc(hospitalDoc.uid),
      );

      Map<String, dynamic> hospitalMap = hospitalFavoriteModel.toMap();
      DocumentReference ref = await FirebaseFirestore.instance
          .collection("FavoriteHospital")
          .add(hospitalMap);

      await ref.update({"uid": ref.id});
    } catch (e) {
      Utils.FlushBarErrorMessage(e.toString(), context);
    }
  }

  Future<HospitalModel> fetchHospitalDetails(
      HospitalFavoriteModel favoriteDoc) async {
    DocumentReference<Map<String, dynamic>>? hospitalRef =
        favoriteDoc.hospitalRef;
    if (hospitalRef != null) {
      DocumentSnapshot HospitalSnapshot = await hospitalRef.get();
      return HospitalModel.fromMap(HospitalSnapshot.data());
    } else {
      throw Exception("Doctor reference is null");
    }
  }

  void deleteFavoriteHospital(HospitalFavoriteModel favoriteDoc) async {
    try {
      await FirebaseFirestore.instance
          .collection("FavoriteHospital")
          .doc(favoriteDoc.uid)
          .delete();
      print("Favorite document successfully deleted!");
    } catch (e) {
      print("Error deleting favorite document: $e");
    }
  }
}
