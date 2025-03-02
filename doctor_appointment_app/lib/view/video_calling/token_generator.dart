import 'package:cloud_functions/cloud_functions.dart';
import 'package:doctor_appointment_app/utils/utils.dart';
import 'package:doctor_appointment_app/view/video_calling/agora_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TokenGeneratorWidget extends StatefulWidget {
  @override
  _TokenGeneratorWidgetState createState() => _TokenGeneratorWidgetState();
}

class _TokenGeneratorWidgetState extends State<TokenGeneratorWidget> {
  String _token = '';
  final TextEditingController _channelNameController = TextEditingController();
  final TextEditingController _tokenController = TextEditingController();
  Future<void> _generateToken() async {
    try {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('generateToken');
      final results = await callable.call(<String, dynamic>{
        'uid': 12345,
        'expiryTime': 3600,
        'channelName': _channelNameController.text,
        // Pass channel name from the text field
      });
      Utils.FlushBarErrorMessage(_channelNameController.text, context);

      setState(() {
        _token = results.data['token']; // Access the token property
      });

      print('Token: $_token');
    } catch (e) {
      print('Error generating token: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate Token'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _channelNameController,
              decoration: InputDecoration(
                labelText: 'Channel Name',
              ),
            ),
            TextField(
              controller: _tokenController,
              decoration: InputDecoration(
                labelText: 'Token',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateToken,
              child: Text('Generate Token'),
            ),
            SizedBox(height: 20),
            Text('Generated Token:'),
            InkWell(
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: _token));
              },
              child: Text(
                _token,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AgoraVideoCalling(
                              channelNamee: _channelNameController.text,
                              token: _tokenController.text)));
                },
                child: Text("Join Now"))
          ],
        ),
      ),
    );
  }
}
