import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:doctor_appointment_app/view/ready_for_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;

  setLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> signUp(String email, String password, String confirmPasswrod,
      String name, BuildContext context) async {
    try {
      setLoading(true);
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
        // userModel.password = _passwordController.text;
        userModel.role = "user";

        await firebaseFirestore
            .collection("Users")
            .doc(user.uid)
            .set(userModel.toMap())
            .then((value) => {
                  setLoading(false),
                  Navigator.push(context,
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
        Utils.FlushBarErrorMessage("Logged In Successfully", context);
        setLoading(false);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ReadyForHome()));
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


  Future<void> authenticatedUser() async{
    UserModel loggedIn = UserModel();
    User? user = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((value){
      loggedIn = UserModel.fromMap(value.data());
      

    });

    Utils.email = loggedIn.email;
    Utils.name = loggedIn.name;

    

    

  }
}
