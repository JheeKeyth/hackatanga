import 'package:flutter/material.dart';
import 'package:hackatanga_project/screens/tour/components/icon_container.dart';
import 'package:hackatanga_project/screens/tour/constants.dart';

class Exemple2LightCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconContainer(
          icon: Icons.brush,
          padding: kPaddingS,
        ),
        IconContainer(
          icon: Icons.camera_alt,
          padding: kPaddingM,
        ),
        IconContainer(
          icon: Icons.straighten,
          padding: kPaddingS,
        ),
      ],
    );
  }
}