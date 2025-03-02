import 'package:cloud_functions/cloud_functions.dart';
import 'package:doctor_appointment_app/view/dummy_files/dummy.dart';
import 'package:doctor_appointment_app/view/video_calling/agora_video.dart';
import 'package:flutter/material.dart';

class JoinMeeting extends StatefulWidget {
  const JoinMeeting({super.key});

  @override
  State<JoinMeeting> createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  final TextEditingController _channelNameController = TextEditingController();
  String _token = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            autofocus: true,
            controller: _channelNameController,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Channel Name',
              labelStyle: const TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
              hintText: 'Enter your channel name...',
              hintStyle: const TextStyle(
                color: Color(0xFF57636C),
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
            keyboardType: TextInputType.text,
            // validator: _channelNameValidator,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              _generateToken(_channelNameController.text);
            },
            child: const Text('Join Room'),
          )
        ],
      ),
    );
  }

  Future<void> _generateToken(String channelName) async {
    try {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('generateToken');
      final results = await callable.call(<String, dynamic>{
        'uid': channelName,
        'expiryTime': 3600,
      });

      setState(() {
        _token = results.data; // Since your function returns the token directly
      });

      print(_token + "AND" + channelName);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Dummy(
                    name: channelName,
                    token: _token,
                  )));

      print('Token: $_token');
    } catch (e) {
      print('Error generating token: $e');
    }
  }
}
