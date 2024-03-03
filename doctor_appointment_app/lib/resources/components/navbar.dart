import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';

// class NavBar extends StatefulWidget {
//   @override
//   _NavBarState createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
//   static const List<Widget> _widgetOptions = <Widget>[
//     // Text(
//     //   'Home',
//     //   style: optionStyle,
//     // ),
//     HomePage(),
//     // Text(
//     //   'Likes',
//     //   style: optionStyle,
//     // ),
//     FavoriteScreen(),
//     Text(
//       'Search',
//       style: optionStyle,
//     ),
//     Text(
//       'Profile',
//       style: optionStyle,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return GNav(
//               rippleColor: Colors.grey[300]!,
//               hoverColor: Colors.grey[100]!,
//               gap: 8,
//               activeColor: Colors.black,
//               iconSize: 24,
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//               duration: Duration(milliseconds: 400),
//               tabBackgroundColor: Colors.grey[100]!,
//               color: Colors.black,
//               tabs: [
//                 GButton(
//                   onPressed: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
//                   },
//                   // icon: LineIcons.home,
//                   icon: Icons.home,
//                   text: 'Home',
//                 ),
//                 GButton(
//                    onPressed: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen()));
//                   },
//                   icon: Icons.calendar_month_sharp,
//                   text: 'Booking',
//                 ),
//                 GButton(
//                   icon: Icons.favorite,
//                   text: 'Favrite',
//                 ),
//                 GButton(
//                   icon: Icons.supervised_user_circle_outlined,
//                   text: 'Profile',
//                 ),
//               ],
//               selectedIndex: _selectedIndex,
//               onTabChange: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//             );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChange;

  NavBar({required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GNav(
        rippleColor: Colors.grey[300]!,
        hoverColor: Colors.grey[100]!,
        gap: 8,
        activeColor: Colors.blue,
        iconSize: 24,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: Duration(milliseconds: 400),
        tabBackgroundColor: Colors.grey[100]!,
        color: Colors.grey,
        tabs: [
          GButton(
            onPressed: () {
              onTabChange(0);
            },
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            onPressed: () {
              onTabChange(1);
            },
            icon: Icons.calendar_month_sharp,
            text: 'Booking',
          ),
          GButton(
            onPressed: () {
              onTabChange(2);
            },
            icon: Icons.favorite,
            text: 'Favorite',
          ),
          GButton(
            onPressed: () {
              onTabChange(3);
            },
            icon: Icons.supervised_user_circle_outlined,
            text: 'Profile',
          ),
        ],
        selectedIndex: selectedIndex,
        onTabChange: onTabChange,
      ),
    );
  }
}
