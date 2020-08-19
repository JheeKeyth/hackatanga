// imports Flutter
import 'package:flutter/widgets.dart';
// imports local pages
import 'package:hackatanga_project/screens/home/home_page.dart';
import 'package:hackatanga_project/screens/tour/tour.dart';

//Routes
final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/" : (BuildContext context) => Tour(),
  "/home" : (BuildContext context) => HomePage(),
  //TODO: Describe application routes.
};