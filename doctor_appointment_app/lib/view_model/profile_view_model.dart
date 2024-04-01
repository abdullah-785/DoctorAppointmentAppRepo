import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:doctor_appointment_app/view/Authentication/sign_in.dart';
import 'package:doctor_appointment_app/view/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel with ChangeNotifier {
  bool isLoading = false;
  bool isNewPasswordUpdated = false;
  bool isShowNewPass = true;
  bool isShowConfirmNewPass = true;

  setLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  setIsNewPassUpdated(value) {
    isNewPasswordUpdated = value;
    notifyListeners();
  }

  setIsShowNewPass(value) {
    isShowNewPass = value;
    notifyListeners();
  }

  setIsShowConNewPass(value) {
    isShowConfirmNewPass = value;
    notifyListeners();
  }

  Future<void> updateUser(String name, String phone, String email, String dob,
      String gender, BuildContext context) async {
    try {
      setLoading(true);
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await FirebaseFirestore.instance.collection("Users").doc(user.uid).set({
          'name': name,
          'phone': phone,
          'email': email,
          'dob': dob,
          'gender': gender,
          'image': Utils.image,
          'role': Utils.role,
          'uid': Utils.uid,
          'address': Utils.address,
        });
        loggedInUser();
        setLoading(false);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Profile()));
      }
      // setLoading(false);
    } catch (error) {
      print("Error updating user: $error");
      setLoading(false);
      throw error; // Handle the error as needed
    }
    // setLoading(false);
  }

  void loggedInUser() {
    UserModel loggedIn = UserModel();
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection("Users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedIn = UserModel.fromMap(value.data());
      print(loggedIn.email);
      Utils.name = loggedIn.name;
      Utils.email = loggedIn.email;
      Utils.image = loggedIn.image;
      Utils.uid = loggedIn.uid;
      Utils.role = loggedIn.role;
      Utils.phone = loggedIn.phone;
      Utils.dob = loggedIn.dob;
      Utils.gender = loggedIn.gender;
      Utils.address = loggedIn.address;
    });
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
  }

  Future<void> updatePassword(
      String password, String confirmPassword, BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      if (password == confirmPassword) {
        await user!.updatePassword(password).then((value) => {logout(context)});
      } else {
        Utils.FlushBarErrorMessage("Both passwords are different", context);
      }
    } catch (e) {
      Utils.FlushBarErrorMessage(e.toString(), context);
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      user!.delete().then((value) => {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignIn()))
          });
    } catch (e) {
      Utils.FlushBarErrorMessage(e.toString(), context);
    }
  }
}
