// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:doctor_appointment_app/view/Authentication/sign_in.dart';
import 'package:doctor_appointment_app/view/ready_for_home.dart';
import 'package:doctor_appointment_app/view_model/auth_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path/path.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswrordController =
      TextEditingController();

  // File? file;

  // // final FirebaseAuth _auth = FirebaseAuth.instance;

  // // bool isLoading = false;

  // ImagePicker image = ImagePicker();

  // String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).width * 1;
    final authViewModel = Provider.of<AuthViewModel>(context);

    // final fileName = file != null ? basename(file!.path) : "No file Selected";
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.c,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      "Fill your information bellow or register\nwith your social network",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // GestureDetector(
                    //   onTap: () async {
                    //     // selectFile();
                    //     // uploadImage();
                    //   },
                    //   child: CircleAvatar(
                    //     radius: 70,
                    //     backgroundImage: imageUrl == null
                    //         ? AssetImage("images/uploadImageVector.jpg")
                    //         : AssetImage("images/2.png"),

                    //         // Image.file(file!).image,
                    //   ),
                    // ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 56,
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 0, bottom: 0, left: 16),
                          prefixIcon: const Icon(Icons.person_4_outlined),
                          hintText: "Enter Your Name",
                          border: Utils.outlineBorder(),
                          focusedBorder: Utils.focusBorder(),
                          enabledBorder: Utils.enableBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 56,
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 0, bottom: 0, left: 16),
                          prefixIcon: const Icon(Icons.email_outlined),
                          hintText: "example@gamil.com",
                          border: Utils.outlineBorder(),
                          focusedBorder: Utils.focusBorder(),
                          enabledBorder: Utils.enableBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 56,
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 0, bottom: 0, left: 16),
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: const Icon(
                            Icons.remove_red_eye,
                            size: 22,
                            color: Color.fromARGB(255, 159, 157, 157),
                          ),
                          hintText: "passoword",
                          border: Utils.outlineBorder(),
                          focusedBorder: Utils.focusBorder(),
                          enabledBorder: Utils.enableBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Confirm Password",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 56,
                      child: TextFormField(
                        controller: _confirmPasswrordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 0, bottom: 0, left: 16),
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: const Icon(
                            Icons.remove_red_eye,
                            size: 22,
                            color: Color.fromARGB(255, 159, 157, 157),
                          ),
                          hintText: "Confirm Password",
                          border: Utils.outlineBorder(),
                          focusedBorder: Utils.focusBorder(),
                          enabledBorder: Utils.enableBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const Text("Agree with Term & Condition")
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        width: width * 1,
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () async {
                              authViewModel.signUp(
                                  _emailController.text,
                                  _passwordController.text,
                                  _confirmPasswrordController.text,
                                  _nameController.text,
                                  context);
                            },
                            child: authViewModel.isLoading == false
                                ? Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                : SpinKitCircle(
                                    color: Colors.white,
                                    size: 35,
                                  ))),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        },
                        child: Text("Have account? Sign in")),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 1,
                          color: Colors.grey.shade200,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("Or sign in with",
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 80,
                          height: 1,
                          color: Colors.grey.shade200,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.withOpacity(.7),
                                ),
                                shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child:
                                  Image(image: AssetImage("images/apple.png")),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.withOpacity(.7),
                                ),
                                shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(11.0),
                              child:
                                  Image(image: AssetImage("images/google.png")),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.withOpacity(.7),
                                ),
                                shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(11.0),
                              child: Image(
                                  image: AssetImage("images/facebook.png")),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
