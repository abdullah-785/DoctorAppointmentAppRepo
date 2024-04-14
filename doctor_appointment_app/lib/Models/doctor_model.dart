import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
  String? uid;
  String? name;
  String? specializeIn;
  String? address;
  DateTime? availabilityTimeTo;
  DateTime? availabilityTimeFrom;
  String? about;
  String? image;

  DoctorModel({
    this.uid,
    this.name,
    this.specializeIn,
    this.address,
    this.availabilityTimeTo,
    this.availabilityTimeFrom,
    this.about,
    this.image,
  });

  factory DoctorModel.fromMap(map) {
    return DoctorModel(
      uid: map['uid'],
      name: map['name'],
      specializeIn: map['specializeIn'],
      address: map['address'],
      availabilityTimeTo: map['availabilityTimeTo'] != null
          ? (map['availabilityTimeTo'] as Timestamp).toDate()
          : null,
      availabilityTimeFrom: map['availabilityTimeFrom'] != null
          ? (map['availabilityTimeFrom'] as Timestamp).toDate()
          : null,
      about: map['about'],
      image: map['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'specializeIn': specializeIn,
      'address': address,
      'availabilityTime': availabilityTimeTo,
      'availabilityTimeFrom': availabilityTimeFrom,
      'about': about,
      'image': image,
    };
  }
}
