import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Privacy Policy"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text("PRIVACY POLICY HERE"),
          )
        ],
      ),
    );
  }
}
