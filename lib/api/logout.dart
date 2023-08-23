// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:tempalteflutter/constance/global.dart' as globals;
import 'package:tempalteflutter/constance/routes.dart';
import 'package:tempalteflutter/constance/sharedPreferences.dart';
import 'package:tempalteflutter/models/userData.dart';
import 'package:tempalteflutter/modules/login/loginScreen.dart';
import 'package:tempalteflutter/utils/dialogs.dart';

class LogOut {
  
  void logout(BuildContext context) async {
    try {
    
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false);
    } on Exception {
      Dialogs.showDialogWithOneButton(
        context,
        "Error",
        "please! try again.",
        onButtonPress: () {},
      );
    }
  }

  Future backSplashScreen(BuildContext context) async {
    try {
      globals.usertoken = '';
      loginUserData = UserData();
      await MySharedPreferences().clearSharedPreferences();
      Navigator.of(context).pushNamed(Routes.LOGIN,);
    } on Exception {
      Dialogs.showDialogWithOneButton(
        context,
        "Error",
        "please! try again.",
        onButtonPress: () {},
      );
    }
  }
}
