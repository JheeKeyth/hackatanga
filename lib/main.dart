//imports flutter
import 'package:flutter/material.dart';

//imports local
import 'package:hackatanga_project/routes.dart';
import 'package:hackatanga_project/theme/constants.dart';
import 'package:hackatanga_project/theme/style.dart';

void main() => runApp(
      MaterialApp(
        title: title_app,
        theme: appTheme(),
        initialRoute: '/',
        routes: routes,
      ),
    );
