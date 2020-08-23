//imports flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackatanga_project/screens/chat/chat.dart';
import 'package:hackatanga_project/screens/home/home.dart';
import 'package:hackatanga_project/screens/home/pages/emergency_page.dart';
<<<<<<< HEAD
import 'package:hackatanga_project/screens/login/login.dart';
=======
import 'package:hackatanga_project/screens/home/pages/juristical_contacts_page.dart';
import 'package:hackatanga_project/screens/home/pages/psychologist_contacts_page.dart';
>>>>>>> 95a9e008943e288a0f07b7e7b80089f20d6a7292

//imports local
import 'package:hackatanga_project/screens/tour/tour.dart';
import 'package:hackatanga_project/theme/constants.dart';
import 'package:hackatanga_project/theme/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(
    MaterialApp(
      title: title_app,
      theme: appTheme(),
      home: Builder(
        builder: (BuildContext context) {
          var screenHeight = MediaQuery.of(context).size.height;
          return Login( screenHeight: screenHeight);
        },
      ),
    ),
  );
}
