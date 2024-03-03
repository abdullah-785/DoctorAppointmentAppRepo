import 'package:doctor_appointment_app/resources/components/navbar.dart';
import 'package:doctor_appointment_app/view/Booking.dart';
import 'package:doctor_appointment_app/view/favorite.dart';
import 'package:doctor_appointment_app/view/home_page.dart';
import 'package:doctor_appointment_app/view/profile.dart';
import 'package:flutter/material.dart';

class ReadyForHome extends StatefulWidget {
  const ReadyForHome({super.key});

  @override
  State<ReadyForHome> createState() => _ReadyForHomeState();
}

class _ReadyForHomeState extends State<ReadyForHome> {
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
