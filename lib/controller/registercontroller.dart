import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register {
var   auth =FirebaseAuth.instance.currentUser!;
  register(String uname, String email, String dob, String gender, String state,
      String city, String rcode, String pn,String uid) async {
    await FirebaseFirestore.instance.collection('UsersData').doc(auth.uid).set({
      "uid": uid,
      "Username": uname,
      "Email": email,
      "DateofBirth": dob,
      "Gender": gender,
      "State": state,
      "City": city,
      "ReferCode": rcode,
      "PhoneNumber": pn,
    });
  }
}
