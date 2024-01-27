import 'package:doctor_appointment_app/screens/doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SpecialistCard extends StatelessWidget {
  const SpecialistCard({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        width: width * 1,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 3),
                color: Colors.grey.withOpacity(0.05),
                spreadRadius: 10,
                blurRadius: 20),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15.0, left: 8, right: 8, bottom: 8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width * 0.24,
                    height: 105,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: const Image(
                          fit: BoxFit.fill,
                          image: AssetImage("images/doctor1.jpg")),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.52,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossA,
                          children: [
                            Container(
                              width: 150,
                              height: 19,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[100]),
                              child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      color: Colors.blue,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Professional Doctor",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    )
                                  ]),
                            ),
                            // Spacer(),
                            Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.favorite_border_rounded,
                                color: Colors.grey[500],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Dr. Jane Cooper",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Dentist",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: width * 0.52,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: Cross,
                          children: [
                            RatingBar.builder(
                              itemSize: 14,
                              initialRating: 4.5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            // SizedBox(width: 8,),
                            Text(
                              "4.8",
                              style: TextStyle(fontSize: 12),
                            ),

                            Container(
                              height: 15,
                              width: 1,
                              color: Colors.grey[400],
                            ),

                            Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "499 Reviews",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[500]),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DoctorDetails()));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width * 0.87,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[100]),
                  child: Text(
                    "Make Oppointment",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
