import 'package:doctor_appointment_app/view/Authentication/sign_up.dart';
import 'package:doctor_appointment_app/view/dumy.dart';
import 'package:doctor_appointment_app/view/onboarding/onboarding.dart';
import 'package:doctor_appointment_app/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel()),
      // ChangeNotifierProvider(create: (_) => A)
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const OnBoarding1(),
      ),
    );
  }
}
