import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class registercontroller {
  var auth = FirebaseAuth.instance.currentUser!;

  final FirebaseStorage _storage = FirebaseStorage.instance;
  
  

  Future<String> uploadImageToFirebase(File file, String filename, String dob, String gender, String phoneController, String country, String statecontroller, String citycontroller, String referCodeController) async {
    try {
      Reference reference = _storage
          .ref()
          .child('images/$filename'); // Use the specified filename

      TaskSnapshot taskSnapshot = await reference.putFile(file);
      if (taskSnapshot.state == TaskState.success) {
        String downloadUrl = await reference.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('UsersData')
            .doc(auth.email)
            .set({
          "Username": auth.displayName,
          "Email": auth.email,
          "DateofBirth": dob,
          "Gender": gender,
          "PhoneNumber": phoneController,
          "Country": country,
          "State": statecontroller,
          "City": citycontroller,
          "ReferCode": referCodeController,
          "uid": auth.uid,
          // "image": downloadUrl,
        });

        return downloadUrl;
      } else {
        throw Exception('Image upload failed');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Image upload failed');
    }
  }

  registerdata() async {}
}
