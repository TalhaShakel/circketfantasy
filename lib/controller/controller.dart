import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tempalteflutter/api/logout.dart';
import 'package:tempalteflutter/modules/login/otpValidationScreen.dart';
class Mycontroller {
  var auth  = FirebaseAuth.instance;
  handleGoogleLogin(context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gauth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: gauth.accessToken, idToken: gauth.idToken);
    try {
      await FirebaseAuth.instance.signInWithCredential(credential
          );
           

      
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  loginwithphonenumber(String phonenumebr, context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        await FirebaseFirestore.instance
            .collection('UsersData')
            .doc(credential.accessToken)
            .set({
          "Username": '-',
          "Email": '-',
          "DateofBirth": "-",
          "Gender": "-",
          "State": "-",
          "City": "-",
          "ReferCode": "-",
          "PhoneNumber": phonenumebr,
          "Country": "-"
        });
      },
      // timeout: const Duration(seconds: 60),
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      phoneNumber: phonenumebr,
      codeSent: (String verificationId, int? resendToken) async {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpValidationScreen(
                verificationId: verificationId,
              ),
            ));
        print('verification id:: $verificationId');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print(('code auto retrive'));
      },
    );
  }

  logout(BuildContext context) async {
    try {
      await GoogleSignIn().signOut();
      LogOut().logout(context);

    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    
  }

  Future<void> phoneSignIn(
    BuildContext context,
    String phoneNumber,
  ) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      codeAutoRetrievalTimeout: (verificationId) {},
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        ScaffoldMessengerState()
            .showSnackBar(SnackBar(content: Text(e.toString())));
      },
      codeSent: (String verificationId, int? resendToken) async {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  OtpValidationScreen(verificationId: verificationId),
            ));
      },
    );
  }
}
