import 'package:flutter/material.dart';

class BookingTime extends StatelessWidget {
  const BookingTime({
    super.key,
    required this.col,
    required this.borderColor,
    required this.textColor,
    required this.time,
  });
  final Color col;
  final Color borderColor;
  final Color textColor;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        width: 90,
        height: 40,
        decoration: BoxDecoration(
            color: col,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: TextStyle(
                  fontSize: 14, color: textColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
