import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils {
  static String? name;
  static String? email;
  static String? image;
  static String? uid;
  static String? role;
  static String? phone;
  static String? dob;
  static String? gender;
  static String? address;
  static String? country = "London";
  static String? countryCode = "UK";
  static String? city = "New York";

  static FlushBarErrorMessage(
    String message,
    BuildContext context,
  ) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,

          backgroundColor: Colors.blue,
          messageColor: Colors.white,
          title: "Information",
          titleColor: Colors.white,
          duration: Duration(seconds: 3),
          borderRadius: BorderRadius.circular(12),
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(10),
          flushbarPosition: FlushbarPosition.TOP,
          icon: Icon(
            Icons.info,
            color: Colors.white,
          ),
          isDismissible: true,

          // forwardAnimationCurve: Curves.bounceIn,
        )..show(context));
  }

  static OutlineInputBorder focusBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
          width: .4, color: Color.fromARGB(255, 178, 177, 177)),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  static OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: .4));
  }

  static OutlineInputBorder enableBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 178, 177, 177),
        width: .4,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
  }
}
