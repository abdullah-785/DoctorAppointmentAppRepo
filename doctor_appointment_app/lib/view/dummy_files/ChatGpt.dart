import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String? imageUrl;
  Future<void> uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    XFile? image;

    // Check Permissions
    // await Permission.photos.request();
    // var permissionStatus = await Permission.photos.status;

    // if (permissionStatus.isGranted) {
    // Select Image
    image = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final file = File(image.path);
      print('Selected file path: ${file.path}');
      try {
        print("1111111111111111");
        // Upload to Firebase
        var uploadTask = _firebaseStorage.ref().child('files').putFile(file);

        // Monitor upload progress
        uploadTask.snapshotEvents.listen((event) {
          print(
              'Upload progress: ${event.bytesTransferred} / ${event.totalBytes}');
        });

        var snapshot = await uploadTask;

        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
        print('Upload successful. Download URL: $downloadUrl');
      } on FirebaseException catch (e) {
        print('FirebaseException: ${e.code} - ${e.message}');
      } catch (e) {
        print('Error: $e');
      }
    } else {
      print('No Image Path Received');
    }
    // } else {
    //   print('Permission not granted. Try Again with permission access');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if (imageUrl != null) Image.network(imageUrl!),
          ElevatedButton(
            onPressed: uploadImage,
            child: Text('Upload Image'),
          ),
        ],
      ),
    );
  }
}
