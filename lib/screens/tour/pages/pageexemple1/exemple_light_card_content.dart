import 'package:flutter/material.dart';
import 'package:hackatanga_project/screens/tour/components/icon_container.dart';
import 'package:hackatanga_project/screens/tour/constants.dart';

class ExempleLightCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconContainer(
          icon: Icons.person,
          padding: kPaddingS,
        ),
        IconContainer(
          icon: Icons.group,
          padding: kPaddingM,
        ),
        IconContainer(
          icon: Icons.insert_emoticon,
          padding: kPaddingS,
        ),
      ],
    );
  }
}