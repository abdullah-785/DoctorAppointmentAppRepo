import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Dummy extends StatefulWidget {
  const Dummy({super.key});

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testiong"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(2, 2),
                          spreadRadius: 2,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: (imageUrl != null)
                        ? Image.network(imageUrl!)
                        : Image.network('https://i.imgur.com/sUFH1Aq.png')),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  child: Text("Upload Image",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  onPressed: () {
                    uploadImage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  uploadImage() async {
    //////////////////////////////
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    XFile? image;

    // Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      // Select Image
      image = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        final file = File(image.path);
        // Upload to Firebase
        var snapshot =
            await _firebaseStorage.ref().child('files').putFile(file);
        final downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }
}
