import 'package:doctor_appointment_app/view/Authentication/sign_up.dart';
import 'package:doctor_appointment_app/view/ready_for_home.dart';
import 'package:doctor_appointment_app/view_model/auth_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).width * 1;
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign In",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Hi! Welcome back, you've been missed",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 60,
            ),
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )),
            SizedBox(
              height: 4,
            ),
            Container(
              height: 56,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    size: 22,
                  ),
                  hintText: "example@gamil.com",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.black54, width: .4)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black54, width: .4),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )),
            SizedBox(
              height: 4,
            ),
            Container(
              height: 56,
              child: TextFormField(
                controller: _passwordController,
                obscureText: authViewModel.isShow,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    size: 22,
                  ),
                  suffixIcon: authViewModel.isShow == false
                      ? InkWell(
                          onTap: () {
                            authViewModel.setIsShow(true);
                          },
                          child: Icon(
                            Icons.visibility,
                            size: 22,
                          ))
                      : InkWell(
                          onTap: () {
                            authViewModel.setIsShow(false);
                          },
                          child: Icon(
                            Icons.visibility_off,
                            size: 22,
                          )),
                  hintText: "Passoword",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.black54, width: .4)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black54, width: .4),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                )),
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
                    authViewModel.signIn(_emailController.text,
                        _passwordController.text, context);
                    // authViewModel.authenticatedUser();

                    // try {
                    //   await _auth.signInWithEmailAndPassword(
                    //       email: _emailController.text,
                    //       password: _passwordController.text);
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => ReadyForHome()));
                    // } catch (e) {
                    //   print(e);
                    // }
                  },
                  child: authViewModel.isLoading == false
                      ? Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      : SpinKitCircle(size: 35, color: Colors.white)),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Text("Have not account? Sign up")),
            const SizedBox(
              height: 35,
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
                      child: Image(image: AssetImage("images/apple.png")),
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
                      child: Image(image: AssetImage("images/google.png")),
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
                      child: Image(image: AssetImage("images/facebook.png")),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
