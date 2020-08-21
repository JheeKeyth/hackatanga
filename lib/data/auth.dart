import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hackatanga_project/screens/home/home.dart';
import 'package:hackatanga_project/screens/tour/tour.dart';

class Auth {
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  login(BuildContext context) async {
    try {
      await googleSignIn.signIn();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Home();
          },
        ),
      );
    } catch (err) {
      print(err);
    }
  }

  Future<void> logout(BuildContext context) async{
    var screenHeight = MediaQuery.of(context).size.height;
    try{
      googleSignIn.signOut();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Tour(
              screenHeight: screenHeight,
            );
          },
        ),
      );
    }catch (error){
      print('ERROR LOGOUT: ${error}');
    }

  }
}
