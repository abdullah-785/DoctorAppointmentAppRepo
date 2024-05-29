import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

// class TokenGeneratorWidget extends StatefulWidget {

class TokenGeneratorWidget extends StatefulWidget {
  @override
  _TokenGeneratorWidgetState createState() => _TokenGeneratorWidgetState();
}

class _TokenGeneratorWidgetState extends State<TokenGeneratorWidget> {
  String _token = '';

  Future<void> _generateToken() async {
    try {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('generateToken');
      final results = await callable.call(<String, dynamic>{
        'uid': 12345,
        'expiryTime': 3600,
      });

      setState(() {
        _token = results.data; // Since your function returns the token directly
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
            Text('Generated Token:'),
            Text(
              _token,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateToken,
              child: Text('Generate Token'),
            ),
          ],
        ),
      ),
    );
  }
}
