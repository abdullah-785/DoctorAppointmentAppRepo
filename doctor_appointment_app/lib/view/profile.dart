import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:doctor_appointment_app/view/Authentication/sign_in.dart';
import 'package:doctor_appointment_app/view/dummy_files/ChatGpt.dart';
import 'package:doctor_appointment_app/view/dummy_files/dummy.dart';
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
import 'package:flutter_blurhash/flutter_blurhash.dart';
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
                child: CachedNetworkImage(
                  imageUrl: Utils.image.toString(),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey,
                    child: Center(
                      child: BlurHash(
                        hash: "LKN]Rv%2Tw=w]~RBVZRi};RPxuwH",
                        imageFit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Image(
                //   image: NetworkImage(Utils.image.toString()),
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyWidget()));
              },
              child: Container(
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
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Logout Account?",
                                style: TextStyle(
                                    color: Colors.black,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Are you sure you want to logout your account?",
                                style: TextStyle(
                                    color: Colors.black,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        "No",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      profileViewModel.logout(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        "Yes",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ));
                    },
                  );
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
