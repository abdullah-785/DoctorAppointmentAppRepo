import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:doctor_appointment_app/view/Authentication/sign_up.dart';
import 'package:doctor_appointment_app/view/home_page.dart';
import 'package:doctor_appointment_app/view/ready_for_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;
  bool isShow = false;

  setLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  setIsShow(value) {
    isShow = value;
    notifyListeners();
  }

  Future<void> signUp(String email, String password, String confirmPasswrod,
      String name, BuildContext context) async {
    try {
      setLoading(true);
      // final ref = FirebaseStorage.instance
      //                               .ref()
      //                               .child("userImage")
      //                               .child(DateTime.now().toString());
      //                           await ref.putFile(file!);
      //                           String imageUrl = await ref.getDownloadURL();
      print(email + " " + password);

      if (password == confirmPasswrod) {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

        UserModel userModel = UserModel();
        User? user = _auth.currentUser;

        userModel.uid = user!.uid;
        userModel.name = name;
        userModel.email = email.trim().toLowerCase();
        userModel.image =
            "https://firebasestorage.googleapis.com/v0/b/doctor-appointment-8be7f.appspot.com/o/userImage%2Fistockphoto-1470505351-612x612.jpg?alt=media&token=ff83d33c-9b9d-4c5c-ba9f-68476427d5c0";
        userModel.role = "user";

        await firebaseFirestore
            .collection("Users")
            .doc(user.uid)
            .set(userModel.toMap())
            .then((value) => {
                  //Save logged in user in shared preferences
                  sharedPref(),
                  setLoading(false),

                  /// navigate to next page
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ReadyForHome()))
                });
      } else if (password != confirmPasswrod) {
        Utils.FlushBarErrorMessage("Passwords are not same", context);
        setLoading(false);
        return;
      } else if (email.isEmpty ||
          password.isEmpty ||
          confirmPasswrod.isEmpty ||
          name.isEmpty) {
        Utils.FlushBarErrorMessage("Please enter required field", context);
        setLoading(false);
        return;
      } else {
        setLoading(false);
        print("else part");
        return;
      }
    } catch (e) {
      print(e);
      Utils.FlushBarErrorMessage(e.toString(), context);
      print("catch part");

      setLoading(false);
      return;
    }
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      setLoading(true);
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        // Utils.FlushBarErrorMessage("Logged In Successfully", context);

        //Save logged in user in shared preferences
        sharedPref();
        setLoading(false);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ReadyForHome()));

        // ReadyForHome()
      } else {
        setLoading(false);
        Utils.FlushBarErrorMessage("Please enter your credientials", context);

        return;
      }
    } catch (e) {
      setLoading(false);
      Utils.FlushBarErrorMessage(e.toString(), context);
      return;
    }
  }

  void sharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    print("Shared Preference is saved");
  }
}
