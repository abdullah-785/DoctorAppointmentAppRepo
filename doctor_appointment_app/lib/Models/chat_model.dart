import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  List<DocumentReference<Map<String, dynamic>>>? users;
  DocumentReference<Map<String, dynamic>>? user_a;
  DocumentReference<Map<String, dynamic>>? user_b;
  DateTime? created_at;

  ChatModel({this.users, this.user_a, this.user_b, this.created_at});

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      users: (map['users'] as List<dynamic>)
          .map((e) => FirebaseFirestore.instance.doc(e as String))
          .toList(),
      user_a: FirebaseFirestore.instance.doc(map['user_a'] as String),
      user_b: FirebaseFirestore.instance.doc(map['user_b'] as String),
      created_at: (map['created_at'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'users': users?.map((e) => e.path).toList(),
      'user_a': user_a?.path,
      'user_b': user_b?.path,
      'created_at': created_at != null ? Timestamp.fromDate(created_at!) : null,
    };
  }
}
