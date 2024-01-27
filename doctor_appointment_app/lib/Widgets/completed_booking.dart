import 'package:flutter/material.dart';

class BookingCardCompleted extends StatelessWidget {
  const BookingCardCompleted({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        width: width * 0.9,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 3),
                  spreadRadius: 5,
                  blurRadius: 40,
                  color: Colors.grey.shade200)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                        text: "Aug 2024 - 10:00 AM",
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                  ),
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Divider(
                height: 1,
                color: Colors.grey.shade200,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width * 0.25,
                    height: 100,
                    child: Image(
                      image: AssetImage("images/doctor1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. Jenny William",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 16,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "G8502 Preston Rd, Inglewood",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.amp_stories_outlined,
                                size: 16,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Booking ID: #646433433",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue[100]),
                    child: Text(
                      "Re-Book",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue),
                    child: Text(
                      "Add Review",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
