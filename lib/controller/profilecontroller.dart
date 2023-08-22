import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profilecontroller {
   getCurrentUserData() async {

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('UsersData')
            .doc(user.uid)
            .get();

        if (userSnapshot.exists) {
         print(userSnapshot.toString());
        }
        print(userSnapshot);
        return userSnapshot;
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }

  
  }
}
