import 'package:doctor_appointment_app/Models/doctor_favorite.dart';
import 'package:doctor_appointment_app/view/Authentication/sign_up.dart';
import 'package:doctor_appointment_app/view/dumy.dart';
import 'package:doctor_appointment_app/view/home_page.dart';
import 'package:doctor_appointment_app/view/onboarding/onboarding.dart';
import 'package:doctor_appointment_app/view/ready_for_home.dart';
import 'package:doctor_appointment_app/view_model/auth_view_model.dart';
import 'package:doctor_appointment_app/view_model/book_oppoint_view_model.dart';
import 'package:doctor_appointment_app/view_model/doctor_favorite_vm.dart';
import 'package:doctor_appointment_app/view_model/hospital_favorite_vm.dart';
import 'package:doctor_appointment_app/view_model/hospital_review_vm.dart';
import 'package:doctor_appointment_app/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  runApp(MyApp());
}

// void readSharedPref() async{
//   final SharedPreferences prefs = await SharedPreferences.getInstance();

//   bool? repeat = prefs.getBool('isLoggedIn');

//   value = repeat;
//   print("The isLoggedIn user value is : " + value.toString());

// }

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? value = true;
  // @override
  // void initState() async{
  //   super.initState();
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  // bool? repeat = prefs.getBool('isLoggedIn');

  // setState(() {
  // value = repeat;
  // });
  // print("The isLoggedIn user value is : " + value.toString());

  // }
  // @override
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => BookOppointmentViewModel()),
        ChangeNotifierProvider(create: (_) => DoctorFavoriteViewModel()),
        ChangeNotifierProvider(create: (_) => HospitalFavoriteViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => HospitalReviewViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: OnBoarding1(),
      ),
    );
  }
}
