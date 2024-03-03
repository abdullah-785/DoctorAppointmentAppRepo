
import 'package:flutter/material.dart';

class WorkingHoursWidget extends StatelessWidget {
  const WorkingHoursWidget({
    super.key, required this.day,
  });
  final String day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day, style: TextStyle(color: Colors.grey),),
          RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: '00:00',
          style: TextStyle(
              fontSize: 14,
              // color: Colors.,
              ),
          children: <TextSpan>[
            TextSpan(
                text: ' - ',
                style: TextStyle(
                    fontSize: 14,
                    // color: Colors.black,
                  )),
            TextSpan(
                text: '00:00',
                style: TextStyle(
                    fontSize: 14,
                    // color: Colors.black,
                    )),
          ],
        ),
      ),
        ],
      ),

    );
  }
}
