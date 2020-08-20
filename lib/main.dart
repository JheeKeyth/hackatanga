//imports flutter
import 'package:flutter/material.dart';
import 'package:hackatanga_project/screens/home/home.dart';

//imports local
import 'package:hackatanga_project/screens/tour/tour.dart';
import 'package:hackatanga_project/theme/constants.dart';
import 'package:hackatanga_project/theme/style.dart';

void main() => runApp(
      MaterialApp(
        title: title_app,
        theme: appTheme(),
        home: Builder(
          builder: (BuildContext context){
            var screenHeight = MediaQuery.of(context).size.height;
            return Home();
//            Tour(
//              screenHeight: screenHeight,
//            );
          },
        ),
      ),
    );
