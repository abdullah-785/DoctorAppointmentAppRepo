import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/booking_model.dart';
import 'package:doctor_appointment_app/Models/doctor_favorite.dart';
import 'package:doctor_appointment_app/Models/faqs_model.dart';
import 'package:doctor_appointment_app/Models/hospital_favorite_model.dart';
import 'package:doctor_appointment_app/resources/components/favorite_hospital.dart';
import 'package:doctor_appointment_app/resources/components/favorite_specialist_card.dart';
import 'package:doctor_appointment_app/resources/components/hospital_card.dart';
import 'package:doctor_appointment_app/resources/components/specialist_card.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  bool isLoading = false;
  final TextEditingController _subectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  Future<Map<String, dynamic>> emailApiCall(String message) async {
    // API endpoint URL
    final apiUrl = Uri.parse("https://api.brevo.com/v3/smtp/email");

    // Request body as a Map
    final Map<String, dynamic> requestBody = {
      "sender": {"name": "Abdullah", "email": "${Utils.email}"},
      "to": [
        {"email": "abdullah.mehmood325@gmail.com", "name": "Abdullah"}
      ],
      "templateId": 2,
      "params": {
        "name": Utils.name,
        "email": Utils.email,
        "phone": Utils.phone,
        "message": message,
      }
    };

    try {
      final response = await http.post(
        apiUrl,
        headers: {
          "accept": "application/json",
          "content-type": "application/json",
          "api-key":
              "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",
        },
        body: jsonEncode(requestBody), // Encode the Map as JSON
      );

      if (response.statusCode == 201) {
        setState(() {
          isLoading = false;
          _subectController.clear();
          _messageController.clear();
        });

        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return CustomAlertDialogServices(
        //         descriptions:
        //             "Success! Your inquiry has been sent. Please check your email for our prompt response ✅",
        //         img: const Image(image: AssetImage("images/profilepic.jpg")),
        //         text: "Ok",
        //         title: name,
        //       );
        //     });
        Utils.FlushBarErrorMessage("Send Request", context);

        return jsonDecode(response.body);
      } else {
        setState(() {
          isLoading = false;
          _subectController.clear();

          _messageController.clear();
        });

        throw Exception(
            "API Request Failed with Status Code: ${response.statusCode}");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        _subectController.clear();

        _messageController.clear();
      });

      throw Exception("API Request Failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            // automaticallyImplyLeading: false,
            centerTitle: true,
            foregroundColor: Colors.black,
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              "Help Center",
              style: TextStyle(color: Colors.black),
            ),
            bottom: const TabBar(
                labelColor: Colors.grey,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(
                    text: "FAQ's",
                  ),
                  Tab(
                    text: "Contact",
                  ),
                ])),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TabBarView(children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('FAQs')
                        .snapshots(),
                    // .snapshots(),

                    // .where('status',isEqualTo: 'Upcomming')
                    // .orderBy('createAt', descending: true)

                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SpinKitCircle(size: 35, color: Colors.blue);
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (!snapshot.hasData) {
                        return const Text('No data found');
                      }

                      final List<FaqsModel> faqs =
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        return FaqsModel.fromMap(
                            document.data() as Map<String, dynamic>);
                      }).toList();

                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 1,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: faqs.length,
                          itemBuilder: (context, index) {
                            return ExpansionTile(
                              // leading: Icon(Icons.info_outline),
                              title: Text('${faqs[index].title}'),
                              subtitle: Text(
                                '${faqs[index].description}',
                                maxLines: 1,
                              ),
                              children: <Widget>[
                                ListTile(
                                    title: Text('${faqs[index].description}')),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                  // SpecialistCard(
                  //   width: width,
                  // ),
                  // SpecialistCard(
                  //   width: width,
                  // ),
                  // SpecialistCard(
                  //   width: width,
                  // ),
                  // SpecialistCard(
                  //   width: width,
                  // ),
                ],
              ),
            ),

            //Hospitals

            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Subject",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 56,
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 0, bottom: 0, left: 16),
                          hintText: "Enter Subject",
                          border: Utils.outlineBorder(),
                          focusedBorder: Utils.focusBorder(),
                          enabledBorder: Utils.enableBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 56,
                    child: TextFormField(
                      controller: _subectController,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 0, bottom: 0, left: 16),
                          hintText: "Enter Email",
                          border: Utils.outlineBorder(),
                          focusedBorder: Utils.focusBorder(),
                          enabledBorder: Utils.enableBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Message",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    controller: _messageController,
                    maxLines: 8,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: 16, bottom: 16, left: 16),
                        hintText: "Message",
                        border: Utils.outlineBorder(),
                        focusedBorder: Utils.focusBorder(),
                        enabledBorder: Utils.enableBorder()),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      emailApiCall(_messageController.text);
                    },
                    child: SizedBox(
                      width: width * 1,
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () async {},
                          child: Text(
                            "Send Request",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
