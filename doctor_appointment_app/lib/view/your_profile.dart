import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:doctor_appointment_app/view/Authentication/sign_in.dart';
import 'package:doctor_appointment_app/view_model/auth_view_model.dart';
import 'package:doctor_appointment_app/view_model/profile_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourProfile extends StatefulWidget {
  const YourProfile({super.key});

  @override
  State<YourProfile> createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
  final TextEditingController _nameController =
      TextEditingController(text: Utils.name);
  final TextEditingController _phoneNumber =
      TextEditingController(text: Utils.phone);
  final TextEditingController _emailController =
      TextEditingController(text: Utils.email);
  final TextEditingController _dobController =
      TextEditingController(text: Utils.dob);
  final TextEditingController _genderControll =
      TextEditingController(text: Utils.gender);

  @override
  Widget build(BuildContext context) {
    final yourProfile = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Your Profile"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SizedBox(
              height: 15,
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
            // SizedBox(
            //   height: 5,
            // ),
            // Text(Utils.email.toString(),
            //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  height: 56,
                  child: TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      // prefixIcon: const Icon(Icons.email_outlined),
                      contentPadding:
                          EdgeInsets.only(top: 0, bottom: 0, left: 16),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.black54, width: .4)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black54, width: .4),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  height: 56,
                  child: TextFormField(
                    controller: _phoneNumber,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      // prefixIcon: const Icon(Icons.email_outlined),

                      contentPadding:
                          EdgeInsets.only(top: 0, bottom: 0, left: 16),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.black54, width: .4)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black54, width: .4),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  height: 56,
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      // prefixIcon: const Icon(Icons.email_outlined),
                      contentPadding:
                          EdgeInsets.only(top: 0, bottom: 0, left: 16),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.black54, width: .4)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black54, width: .4),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "DOB",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  height: 56,
                  child: TextFormField(
                    controller: _dobController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      // prefixIcon: const Icon(Icons.email_outlined),
                      contentPadding:
                          EdgeInsets.only(top: 0, bottom: 0, left: 16),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.black54, width: .4)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black54, width: .4),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Gender",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  height: 56,
                  child: TextFormField(
                    controller: _genderControll,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      // prefixIcon: const Icon(Icons.email_outlined),
                      contentPadding:
                          EdgeInsets.only(top: 0, bottom: 0, left: 16),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.black54, width: .4)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black54, width: .4),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    //'/Update Here
                    yourProfile.updateUser(
                        _nameController.text,
                        _phoneNumber.text,
                        _emailController.text,
                        _dobController.text,
                        _genderControll.text,
                        context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 1,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: yourProfile.isLoading == false
                        ? Text(
                            "Update",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        : SpinKitCircle(
                            color: Colors.white,
                            size: 30,
                          ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
