import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/booking_model.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:doctor_appointment_app/view/Booking.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookOppointmentViewModel with ChangeNotifier{
  
  //declared
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DateTime? selectedDate;
  String? slot;
  bool isLoading = false;

  //setter 
  setDateTime(DateTime value){
    selectedDate = value;
    notifyListeners();
  }

  setSlot(String value){
    slot = value;
    notifyListeners();
  }

  setIsLoading(bool value){
    isLoading = true;
    notifyListeners();
  }


//Book Oppointment 
void bookOppointment(String doctorUid, BuildContext context) async {

  try {
    
    if(slot == null  || selectedDate == null){
      
      Utils.FlushBarErrorMessage("Please select your Slot and Date", context);
      return;
    }
    setIsLoading(true);
    
  int? generatedBookingId = generateAutoBookingId();
  // Create a DoctorModel instance
  BookingModel doctorModel = BookingModel(
    bookingId: '#01002'+ generatedBookingId.toString(),
    date: selectedDate,
    time: slot,
    status: "Upcomming",
    doctorRef: FirebaseFirestore.instance.collection('Doctor').doc(doctorUid),
    userRef: FirebaseFirestore.instance.collection("Users").doc(Utils.uid),
  );

  // Convert DoctorModel instance to a map
  Map<String, dynamic> doctorMap = doctorModel.toMap();

  // Store the map in Firestore
  await FirebaseFirestore.instance.collection('Oppointments').add(doctorMap);

  setIsLoading(false);
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Bookings()));
  } catch (e) {
    setIsLoading(false);
    Utils.FlushBarErrorMessage(e.toString(), context);
  }
  
}


//Auto Generated Key
int? generateAutoBookingId(){
   Random random = Random();
   int randomNumber;

  // Generate and print 5 random numbers
  for (int i = 0; i < 5; i++) {
    int randomNumber = random.nextInt(100); // Change 100 to the desired range
    print(randomNumber);
    return randomNumber;
  }
  
}




}