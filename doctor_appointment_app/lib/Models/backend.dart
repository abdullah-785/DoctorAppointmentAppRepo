// Get reference to Firestore collection
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<UserModel?> getCurrentUser() async {
  // Get current user UID
  String uid = FirebaseAuth.instance.currentUser!.uid;

  // Query Firestore to get the user document
  DocumentSnapshot userDocument = await users.doc(uid).get();

  // Check if the document exists
  if (userDocument.exists) {
    // Convert the document to a UserModel object
    UserModel user = UserModel.fromMap(userDocument.data()!);
    return user;
  } else {
    // Document does not exist
    return null;
  }
}
