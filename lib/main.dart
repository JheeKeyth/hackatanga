//imports flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackatanga_project/screens/chat/chat.dart';
import 'package:hackatanga_project/screens/home/home.dart';
import 'package:hackatanga_project/screens/home/pages/home_page.dart';

//imports local
import 'package:hackatanga_project/screens/tour/tour.dart';
import 'package:hackatanga_project/theme/constants.dart';
import 'package:hackatanga_project/theme/style.dart';

bool USE_FIRESTORE_EMULATOR = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (USE_FIRESTORE_EMULATOR) {
    FirebaseFirestore.instance.settings = Settings(
        host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
  }
  runApp(
    MaterialApp(
      title: title_app,
      theme: appTheme(),
      home: Builder(
        builder: (BuildContext context) {
          // var screenHeight = MediaQuery.of(context).size.height;
          return Home();
          // return Chat();
          // // return Tour(
          // //   screenHeight: screenHeight,
          // // );
        },
      ),
    ),
  );
}
