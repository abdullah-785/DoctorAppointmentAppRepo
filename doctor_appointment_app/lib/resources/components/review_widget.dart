
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(alignment: Alignment.bottomRight, children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: const Image(
                        image: AssetImage("images/doctor1.jpg"),
                        fit: BoxFit.cover,
                      )),
                ),
                const Icon(Icons.verified,
                    color: Colors.blue, size: 16),
              ]),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "Dale Thiel",
                style: TextStyle(fontSize: 14),
              ),
              const Spacer(),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      Text("5.0")
                    ],
                  ),
                  Text("11 month ago", style: TextStyle(fontSize: 11, color: Colors.grey),)
                ],
              )
            ],
          ),
          SizedBox(height: 4,),
          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
          style: TextStyle(fontSize: 14, color: Colors.grey),
          
          ),
          SizedBox(height: 5,),

          Row(
            children: [

              RatingBar.builder(
                              itemSize: 16,
                              initialRating: 4.5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.blue,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(width: 8,),

                            Text("5.0", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
            ],
          ),
          
        ],
      ),
    );
  }
}
