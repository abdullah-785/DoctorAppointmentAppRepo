import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/backend.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:doctor_appointment_app/view_model/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  // final loggedIn = AuthViewModel().authenticatedUser();
  UserModel loggedIn = UserModel();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    

    FirebaseFirestore.instance.collection("Users").doc(user!.uid).get().then((value){
      loggedIn = UserModel.fromMap(value.data());
      

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade400)),
                child: Icon(
                  Icons.arrow_back,
                  size: 18,
                ),
              ),
              Expanded(
                  child: Text(
                textAlign: TextAlign.center,
                "Your Profile",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ))
            ],
          ),
          SizedBox(
            height: 40,
          ),

          Stack(alignment: Alignment.bottomRight, children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: const Image(
                    image: AssetImage("images/doctor1.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                  color: Colors.blue),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 16,
              ),
            )
          ]),
          SizedBox(
            height: 5,
          ),
          Text(loggedIn.name.toString(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),

          SizedBox(
            height: 60,
          ),

          Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Your Profile",
              )),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.blue,
              )
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
          ),

          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.favorite_outline_rounded,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Favourite",
              )),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.blue,
              )
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
          ),

          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Settings",
              )),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.blue,
              )
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Help Center",
              )),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.blue,
              )
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
          ),

          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.lock_outline_rounded,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Privacy Policy",
              )),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.blue,
              )
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
          ),

          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.logout_rounded,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Logout",
              )),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Colors.blue,
              )
            ],
          ),
          // Divider(color: Colors.grey.shade300,)
        ]),
      ),
    );
  }
}
