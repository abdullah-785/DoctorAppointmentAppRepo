import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_app/Models/chat_model.dart';
import 'package:doctor_appointment_app/Models/doctor_model.dart';
import 'package:doctor_appointment_app/view_model/chatMessage_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class ListOfChats extends StatefulWidget {
  ListOfChats({super.key, this.doctorDoc});

  DoctorModel? doctorDoc;

  @override
  State<ListOfChats> createState() => _ListOfChatsState();
}

class _ListOfChatsState extends State<ListOfChats> {
  @override
  Widget build(BuildContext context) {
    final chatMessageViewModel = Provider.of<ChatMessageViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Chats"),
      ),
      body: Column(
        children: [
          // ChatsWidght(),
          ElevatedButton(
              onPressed: () {
                chatMessageViewModel.createChat(widget.doctorDoc!, context);
              },
              child: Text('create')),

          // StreamBuilder<QuerySnapshot>(
          //   stream: FirebaseFirestore.instance
          //       .collection('Chats')
          //       // .where('userRef', isEqualTo: 'Users/${Utils.uid}')
          //       .snapshots(),
          //   // .where('userRef', isEqualTo: 'Users/${Utils.uid}')

          //   // .snapshots(),

          //   // .where('status',isEqualTo: 'Upcomming')
          //   // .orderBy('createAt', descending: true)

          //   builder:
          //       (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return SpinKitThreeBounce(size: 20, color: Colors.blue);
          //     }
          //     if (snapshot.hasError) {
          //       return Text('Error: ${snapshot.error}');
          //     }

          //     if (!snapshot.hasData) {
          //       return const Text('No data found');
          //     }

          //     final List<ChatModel> chats =
          //         snapshot.data!.docs.map((DocumentSnapshot document) {
          //       return ChatModel.fromMap(
          //           document.data() as Map<String, dynamic>);
          //     }).toList();

          //     return Expanded(
          //       child: ListView.builder(
          //         scrollDirection: Axis.vertical,
          //         itemCount: chats.length,
          //         itemBuilder: (context, index) {
          //           return ChatsWidght(
          //               // widthParam: width * 1,
          //               // hospitalFavDoc: hospitalFavorite[index],
          //               );
          //         },
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}

class ChatsWidght extends StatelessWidget {
  const ChatsWidght({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/doctor-appointment-8be7f.appspot.com/o/userImage%2Fportrait-beautiful-female-model-profile-260nw-1054633154.webp?alt=media&token=73d81c7e-190a-40fb-9543-e7f8f2e68853")),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Asim",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
