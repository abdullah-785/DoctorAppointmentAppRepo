import 'package:flutter/material.dart';

class HospitalShimmer extends StatelessWidget {
  const HospitalShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 10,
            blurRadius: 20,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 8, right: 8, bottom: 8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.24,
                  height: 105,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container()),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.58,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 150,
                            height: 19,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue[100],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.verified,
                                  color: Colors.blue,
                                  size: 14,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.52,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // RatingBar.builder(
                          //   itemSize: 14,
                          //   initialRating: 4.8,
                          //   minRating: 1,
                          //   direction: Axis.horizontal,
                          //   allowHalfRating: true,
                          //   itemCount: 5,
                          //   itemPadding: EdgeInsets.symmetric(horizontal: 0),
                          //   itemBuilder: (context, _) => Icon(
                          //     Icons.star,
                          //     color: Colors.amber,
                          //   ),
                          //   onRatingUpdate: (rating) {
                          //     print(rating);
                          //   },
                          // ),
                          // Text(
                          //   "4.8",
                          //   style: TextStyle(fontSize: 12),
                          // ),
                          // Container(
                          //   height: 15,
                          //   width: 1,
                          //   color: Colors.grey[400],
                          // ),

                          // Text(
                          //   "${doctorViewModel.reviews} Reviews",
                          //   style: TextStyle(
                          //       fontSize: 12, color: Colors.grey[500]),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.87,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[100],
              ),
              child: Text(
                "Make Appointment",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
