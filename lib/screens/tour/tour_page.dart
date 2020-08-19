import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackatanga_project/screens/tour/components/cards_stack.dart';
import 'package:hackatanga_project/screens/tour/constants.dart';


class TourPage extends StatelessWidget {
  final int number;
  final Widget lightCardChild;
  final Widget darkCardChild;
  final Animation<Offset> lightCardOffsetAnimation;
  final Animation<Offset> darkCardOffsetAnimation;
  final Widget textColumn;

  const TourPage({
    @required this.number,
    @required this.lightCardChild,
    @required this.darkCardChild,
    @required this.lightCardOffsetAnimation,
    @required this.darkCardOffsetAnimation,
    @required this.textColumn,
  })  : assert(number != null),
        assert(lightCardChild != null),
        assert(darkCardChild != null),
        assert(lightCardOffsetAnimation != null),
        assert(darkCardOffsetAnimation != null),
        assert(textColumn != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardsStack(
          pageNumber: number,
          lightCardChild: lightCardChild,
          darkCardChild: darkCardChild,
          lightCardOffsetAnimation: lightCardOffsetAnimation,
          darkCardOffsetAnimation: darkCardOffsetAnimation,
        ),
        SizedBox(
          height: number % 2 == 1 ? 50.0 : 25.0,
        ),
        AnimatedSwitcher(
          duration: kCardAnimationDuration,
          child: textColumn,
        ),
      ],
    );
  }
}