
import 'package:doctor_appointment_app/view/Authentication/sign_in.dart';
import 'package:doctor_appointment_app/view/Authentication/sign_up.dart';
import 'package:doctor_appointment_app/view/ready_for_home.dart';
import 'package:flutter/material.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child:  Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
              ),
            ),

            index == 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: width * 0.85,
                            height: height * 0.45,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: const Image(
                                  // fit: BoxFit.,
                                  image: AssetImage("images/4.png")),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: 'Discover ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Experienced',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: '\nDoctors!',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                : Container(),

            index == 1
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: width * 0.85,
                            height: height * 0.45,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: const Image(
                                  // fit: BoxFit.cover,
                                  image: AssetImage("images/1.png")),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: 'Effortless ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Appointment',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: '\nBooking!',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                : Container(),
            index == 2
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: width * 0.85,
                            height: height * 0.45,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: const Image(
                                  // fit: BoxFit.cover,
                                  image: AssetImage("images/2.png")),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: 'Learn About ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Your',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: '\nDoctors!',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                : Container(),

            ///////////Bottom Row
            ///
            ///
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (index == 0) {
                        //
                      } else {
                        setState(() {
                          index--;
                        });
                      }
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        // color: Colors.blue,
                        border: Border.all(color: Colors.blue),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: index == 0 ? 10 : 8,
                        height: index == 0 ? 10 : 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 0 ? Colors.blue : Colors.grey[400]),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: index == 1 ? 10 : 8,
                        height: index == 1 ? 10 : 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 1 ? Colors.blue : Colors.grey[400]),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: index == 2 ? 10 : 8,
                        height: index == 2 ? 10 : 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 2 ? Colors.blue : Colors.grey[400]),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      if (index == 2) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      } else {
                        setState(() {
                          index = index + 1;
                          print(index);
                        });
                      }
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
