// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:doctor_appointment_app/screens/Authentication/sign_in.dart';
import 'package:doctor_appointment_app/screens/ready_for_home.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).width * 1;
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
                      height: 20,
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
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_4_outlined),
                        hintText: "Enter Your Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.black54, width: .4)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black54, width: .4),
                          borderRadius: BorderRadius.circular(8.0),
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
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        hintText: "example@gamil.com",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.black54, width: .4)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black54, width: .4),
                          borderRadius: BorderRadius.circular(8.0),
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
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        hintText: "passoword",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.black54, width: .4)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black54, width: .4),
                          borderRadius: BorderRadius.circular(8.0),
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
                    TextFormField(
                      controller: _confirmPasswrordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        hintText: "Confirm Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.black54, width: .4)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black54, width: .4),
                          borderRadius: BorderRadius.circular(8.0),
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
                            try {
                              setState(() {
                                isLoading = true;
                              });

                              if (_passwordController.text ==
                                  _confirmPasswrordController.text) {
                                await _auth.createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text);

                                FirebaseFirestore firebaseFirestore =
                                    FirebaseFirestore.instance;

                                UserModel userModel = UserModel();
                                User? user = _auth.currentUser;

                                userModel.uid = user!.uid;
                                userModel.name = _nameController.text;
                                userModel.email =
                                    _emailController.text.trim().toLowerCase();
                                // userModel.password = _passwordController.text;
                                userModel.role = "user";

                                await firebaseFirestore
                                    .collection("Users")
                                    .doc(user.uid)
                                    .set(userModel.toMap())
                                    .then((value) => {
                                          setState(() {
                                            isLoading = false;
                                          }),
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReadyForHome()))
                                        });
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                print("else part");
                                return;
                              }
                            } catch (e) {
                              print(e);
                              print("catch part");

                              setState(() {
                                isLoading = false;
                              });
                              return;
                            }
                            setState(() {
                              isLoading = false;
                            });

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => SignIn()));
                          },
                          child: isLoading == false
                              ? Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )),
                    ),
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
