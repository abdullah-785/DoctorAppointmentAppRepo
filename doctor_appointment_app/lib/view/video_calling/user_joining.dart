import 'package:doctor_appointment_app/view/video_calling/agora_video.dart';
import 'package:flutter/material.dart';

class UserJoiningWidget extends StatefulWidget {
  const UserJoiningWidget({super.key});

  @override
  State<UserJoiningWidget> createState() => _UserJoiningWidgetState();
}

class _UserJoiningWidgetState extends State<UserJoiningWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _tokenController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("uSER Join"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(hintText: "Name"),
          ),
          TextFormField(
            controller: _tokenController,
            decoration: InputDecoration(hintText: "Token"),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AgoraVideoCalling(
                            channelNamee: _nameController.text,
                            token: _tokenController.text)));
              },
              child: Text("Join"))
        ],
      ),
    );
  }
}
