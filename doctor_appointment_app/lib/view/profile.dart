import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:doctor_appointment_app/view/Authentication/sign_in.dart';
import 'package:doctor_appointment_app/view/help_center.dart';
import 'package:doctor_appointment_app/view/privacy_policy.dart';
import 'package:doctor_appointment_app/view/setting.dart';
import 'package:doctor_appointment_app/view/update_password.dart';
import 'package:doctor_appointment_app/view/your_profile.dart';
import 'package:doctor_appointment_app/view_model/auth_view_model.dart';
import 'package:doctor_appointment_app/view_model/profile_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profile"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(children: [
          SizedBox(
            height: 30,
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
                  child: Image(
                    image: NetworkImage(Utils.image.toString()),
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
          Text(Utils.email.toString(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),

          SizedBox(
            height: 60,
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => YourProfile()));
            },
            child: Row(
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
          ),
          Divider(
            color: Colors.grey.shade300,
          ),

          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Setting()));
            },
            child: Row(
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
                  "Setting",
                )),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.blue,
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HelpCenter()));
            },
            child: Row(
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
          ),
          Divider(
            color: Colors.grey.shade300,
          ),

          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicy()));
            },
            child: Row(
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
                  child: GestureDetector(
                onTap: () {
                  profileViewModel.logout(context);
                },
                child: Text(
                  "Logout",
                ),
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

  // Future<void> logout(BuildContext context) async {
  //   await FirebaseAuth.instance.signOut();
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('isLoggedIn');

  //   Navigator.of(context)
  //       .pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
  // }
}
