import 'package:doctor_appointment_app/screens/ready_for_home.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).width * 1;
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
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
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
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: const Icon(Icons.remove_red_eye),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReadyForHome()));
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ),
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
