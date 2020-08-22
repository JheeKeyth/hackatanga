import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hackatanga_project/models/user.dart';
import 'package:hackatanga_project/screens/register/register.dart';
import 'package:hackatanga_project/screens/tour/tour.dart';

class Auth {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel user;
  loginGoogle(BuildContext context) async{
    try {
//      _dialogPhoneNumber(context);
      await _googleSignIn.signIn().then((response) => (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Register(
                isGoogleAuth: true,
                user: new UserModel(
                  email: response.email,
                  name: response.displayName,
                ),
              );
            },
          ),
        );
      });
    } catch (err) {
      print(err);
    }
  }

  Future<void> logoutGoogle(BuildContext context) async{
    var screenHeight = MediaQuery.of(context).size.height;
    try{
      _googleSignIn.signOut();
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

  Future<void> loginPhone(String mobile, BuildContext context) async{
    _auth.verifyPhoneNumber(
        phoneNumber: mobile,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential authCredential){
          //code for signing in
          try{

          }catch(error){
            print(error);
          }
        },
        verificationFailed: null,
        codeSent: null,
        codeAutoRetrievalTimeout: null
    );
  }



}
