import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/chat_model.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:doctor_appointment_app/Models/message_model.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
// import 'package:doctor_appointment_app/view/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatMessageViewModel with ChangeNotifier {
  // Future<void> createChat(DoctorModel doctorDoc, BuildContext context) async {
  //   DocumentReference<Map<String, dynamic>> currentUserRef =
  //       FirebaseFirestore.instance.collection('Users').doc(Utils.uid);

  //   DocumentReference<Map<String, dynamic>> doctorRef =
  //       FirebaseFirestore.instance.collection('Doctor').doc(doctorDoc.uid);

  //   List<DocumentReference<Map<String, dynamic>>> usersList = [
  //     currentUserRef,
  //     doctorRef
  //   ];

  //   ChatModel chatModel = ChatModel(
  //     users: usersList,
  //     user_a: currentUserRef,
  //     user_b: doctorRef,
  //     created_at: DateTime.now(),
  //   );

  //   final createdChat = await FirebaseFirestore.instance
  //       .collection('Chats')
  //       .add(chatModel.toMap());
  //   DocumentReference<Map<String, dynamic>> createChatRef =
  //       FirebaseFirestore.instance.collection('Chats').doc(createdChat.);

  //   ///Create Message Document
  //   ///
  //   // MessageModel messageModel = MessageModel(m)

  //   Utils.FlushBarErrorMessage("${createChatRef}", context);
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => ChatScreen(
  //                 chatRef: createChatRef,
  //               )));
  // }

  Future<DocumentReference<Map<String, dynamic>>> createChat(
      DoctorModel doctorDoc, BuildContext context) async {
    try {
      // Get current user reference
      DocumentReference<Map<String, dynamic>> currentUserRef =
          FirebaseFirestore.instance.collection('Users').doc(Utils.uid);

      // Get doctor reference
      DocumentReference<Map<String, dynamic>> doctorRef =
          FirebaseFirestore.instance.collection('Doctor').doc(doctorDoc.uid);

      // Create ChatModel instance
      ChatModel chatModel = ChatModel(
        users: [currentUserRef, doctorRef],
        user_a: currentUserRef,
        user_b: doctorRef,
        created_at: DateTime.now(),
      );

      // Add chat model to Firestore
      DocumentReference<Map<String, dynamic>> createdChatRef =
          await FirebaseFirestore.instance
              .collection('Chats')
              .add(chatModel.toMap());

      // Show success message and navigate to ChatScreen
      Utils.FlushBarErrorMessage("Chat created: ${createdChatRef.id}", context);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => ChatScreen(
      //               chatRef: createdChatRef,
      //             )));

      // Return the created chat document reference
      return createdChatRef;
    } catch (e) {
      // Handle errors
      Utils.FlushBarErrorMessage("Error creating chat: $e", context);
      rethrow;
    }
  }

  // Future<List<DocumentSnapshot<Map<String, dynamic>>>> getUsersFromChat(
  //     DocumentReference<Map<String, dynamic>> chatRef) async {
  //   try {
  //     // Fetch the chat document
  //     DocumentSnapshot<Map<String, dynamic>> chatSnapshot = await chatRef.get();

  //     // Check if the chat document exists
  //     if (!chatSnapshot.exists) {
  //       throw Exception("Chat document does not exist.");
  //     }

  //     // Extract user_a and user_b references
  //     DocumentReference<Map<String, dynamic>> userARef =
  //         chatSnapshot.data()?['user_a'];
  //     DocumentReference<Map<String, dynamic>> userBRef =
  //         chatSnapshot.data()?['user_b'];

  //     // Fetch the user documents
  //     DocumentSnapshot<Map<String, dynamic>> userASnapshot =
  //         await userARef.get();
  //     DocumentSnapshot<Map<String, dynamic>> userBSnapshot =
  //         await userBRef.get();

  //     // Return the user documents
  //     return [userASnapshot, userBSnapshot];
  //   } catch (e) {
  //     print("Error getting users from chat: $e");
  //     return [];
  //   }
  // }
}
