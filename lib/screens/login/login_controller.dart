import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hackatanga_project/data/auth.dart';
import 'package:hackatanga_project/screens/tour/tour.dart';

class LoginController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  Auth auth = new Auth();

  loginGoogle(BuildContext context) async {
    try {
      //_dialogPhoneNumber(context);
    } catch (err) {
      print(err);
    }
  }

  logout(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    _googleSignIn.signOut();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Tour(
            screenHeight: screenHeight,
          );
        },
      ),
    );
  }
}
