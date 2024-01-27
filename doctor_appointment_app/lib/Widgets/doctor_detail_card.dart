
import 'package:flutter/material.dart';


class DoctorDetailCard extends StatelessWidget {
  const DoctorDetailCard({
    super.key, required this.iconData, required this.audience, required this.audienceName,
  });
  final IconData iconData;
  final String audience;
  final String audienceName;

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Container(
                  width: 55,
                  height: 55,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 219, 234, 254),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child:
                        Icon(iconData, color: Colors.blue,),
                  )),
                  SizedBox(height: 5,),
               Text(
                audience,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(audienceName,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                ),)
            ],
          );
  }
}