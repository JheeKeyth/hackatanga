import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackatanga_project/components/logo.dart';
import 'package:hackatanga_project/screens/tour/constants.dart';

class Header extends StatelessWidget {
  final VoidCallback onSkip;

  const Header({
    @required this.onSkip,
  }) : assert(onSkip != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        GestureDetector(
          onTap: onSkip,
          child: Text(
            'Pular',
            style:
            Theme.of(context).textTheme.subtitle1.copyWith(color: kWhite),
          ),
        ),
      ],
    );
  }
}