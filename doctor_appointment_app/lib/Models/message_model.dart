import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? message;
  DateTime? created_at;
  DocumentReference<Map<String, dynamic>>? from;
  DocumentReference<Map<String, dynamic>>? to;
  DocumentReference<Map<String, dynamic>>? chatRef;

  MessageModel(
      {this.message, this.created_at, this.from, this.to, this.chatRef});

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
        message: map['message'],
        created_at: (map['create_at'] as Timestamp?)?.toDate(),
        from: FirebaseFirestore.instance.doc(map['from']),
        to: FirebaseFirestore.instance.doc(map['to']),
        chatRef: FirebaseFirestore.instance.doc(map['chatRef']));
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'create_at': created_at != null ? Timestamp.fromDate(created_at!) : null,
      'from': from?.path,
      'to': to?.path,
      'chatRef': chatRef?.path
    };
  }
}



// (map['createdAt'] as Timestamp?)?.toDate() ,