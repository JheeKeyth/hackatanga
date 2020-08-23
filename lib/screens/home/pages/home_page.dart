import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackatanga_project/screens/home/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController;
 
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: slider.length,
      allowImplicitScrolling: true,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(slider[index]),
            ),
            Center(
              child: Text(
                'Se identificou com alguma situação? \n Não tenha medo de pedir ajuda.\n Estamos aqui por você!',
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                  fontSize: 24,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
