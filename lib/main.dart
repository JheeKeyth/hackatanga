//imports flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackatanga_project/screens/chat/chat.dart';

//imports local
import 'package:hackatanga_project/screens/tour/tour.dart';
import 'package:hackatanga_project/theme/constants.dart';
import 'package:hackatanga_project/theme/style.dart';
// import 'package:hackatanga_project/screens/home/pages/emergency_page.dart';

void main() => runApp(
      MaterialApp(
        title: title_app,
        theme: appTheme(),
        home: Builder(
          builder: (BuildContext context) {
            var screenHeight = MediaQuery.of(context).size.height;
            return Home();
//            Tour(
//              screenHeight: screenHeight,
//            );
          },
        ),
      ),
    ),
  );
}
