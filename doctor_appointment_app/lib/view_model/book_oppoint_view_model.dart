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
  String date = selectedDate!.year.toString() +"-"+ selectedDate!.month.toString() +"-"+ selectedDate!.day.toString();
  
  // Create a DoctorModel instance
  BookingModel doctorModel = BookingModel(
    bookingId: '#01002'+ generatedBookingId.toString(),
    date: date, 
    time: slot,
    status: "Upcomming",
    doctorRef: FirebaseFirestore.instance.collection('Doctor').doc(doctorUid),
    userRef: FirebaseFirestore.instance.collection("Users").doc(Utils.uid),
    createAt: DateTime.now(),
    
  );

  // Convert DoctorModel instance to a map
  Map<String, dynamic> doctorMap = doctorModel.toMap();

  // Store the map in Firestore
  DocumentReference documentReference =  await FirebaseFirestore.instance.collection('Oppointments').add(doctorMap);
  // Update the uid field with the document ID
  await documentReference.update({'uid': documentReference.id});

  setIsLoading(false);
  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Bookings()));
  Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const Bookings(),
    ),
  );

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


  Future<DoctorModel> fetchDoctorDetails(BookingModel bookingDoc) async {
  DocumentReference<Map<String, dynamic>>? doctorRef = bookingDoc.doctorRef;
  if (doctorRef != null) {
    String doctorId = doctorRef.id; // Extracting the document ID directly
    DocumentSnapshot doctorSnapshot = await FirebaseFirestore.instance
        .collection("Doctor")
        .doc(doctorId)
        .get();
    return DoctorModel.fromMap(doctorSnapshot.data()!);
  } else {
    throw Exception("Doctor reference is null");
  }
}





}