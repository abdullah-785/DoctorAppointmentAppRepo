import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/user_model.dart';
import 'package:doctor_appointment_app/resources/components/navbar.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:doctor_appointment_app/view/Booking.dart';
import 'package:doctor_appointment_app/view/favorite.dart';
import 'package:doctor_appointment_app/view/home_page.dart';
import 'package:doctor_appointment_app/view/profile.dart';
import 'package:doctor_appointment_app/view_model/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReadyForHome extends StatefulWidget {
  const ReadyForHome({super.key});

  @override
  State<ReadyForHome> createState() => _ReadyForHomeState();
}

class _ReadyForHomeState extends State<ReadyForHome> {
  UserModel loggedIn = UserModel();
  User? user = FirebaseAuth.instance.currentUser;
  // AuthViewModel? authViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // authViewModel!.loggedInUser();
    _fetchIpInfo();
    FirebaseFirestore.instance
        .collection("Users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedIn = UserModel.fromMap(value.data());
      print(loggedIn.email);
      Utils.name = loggedIn.name;
      Utils.email = loggedIn.email;
      Utils.image = loggedIn.image;
      Utils.uid = loggedIn.uid;
      Utils.role = loggedIn.role;
      Utils.phone = loggedIn.phone;
      Utils.dob = loggedIn.dob;
      Utils.gender = loggedIn.gender;
      Utils.address = loggedIn.address;
    });
  }

  Future<String> _fetchIpInfo() async {
    final response = await http.get(Uri.parse('http://ip-api.com/json'));
    if (response.statusCode == 200) {
      print(response.body);

      var result = jsonDecode(response.body);
      Utils.country = result['country'];
      Utils.city = result['city'];
      Utils.countryCode = result['countryCode'];
      print(result['country']);
      return result;
    } else {
      throw Exception('Failed to load IP info');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyBottomNavBar();
  }
}

class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  _widgetOptions[_selectedIndex],
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: _bottomNavBarForCurrentPage(),
    );
  }

  Widget _bottomNavBarForCurrentPage() {
    // Check the current page and decide whether to show the bottom navigation bar
    if (_selectedIndex == 0 ||
        _selectedIndex == 1 ||
        _selectedIndex == 2 ||
        _selectedIndex == 3) {
      return NavBar(
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      );
    } else {
      // For pages where you don't want to show the bottom navigation bar, return an empty container
      return SizedBox.shrink();
    }
  }
}

List<Widget> _widgetOptions = [
  HomePage(),
  Bookings(),
  FavoriteScreen(),
  Profile()
];
