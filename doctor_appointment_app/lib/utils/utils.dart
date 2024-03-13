import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils{

  static String? name;
  static String? email;
  static String? image;
  static String? uid;
  static String? role;



  static FlushBarErrorMessage(String message, BuildContext context){
    showFlushbar(context: context, flushbar: Flushbar(
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
      icon: Icon(Icons.info, color: Colors.white,),
      isDismissible: true,
      
      // forwardAnimationCurve: Curves.bounceIn,

    )..show(context));
  }


  
}