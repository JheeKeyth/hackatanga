import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackatanga_project/screens/login/components/custom_button.dart';
import 'package:hackatanga_project/screens/login/components/custom_input_field.dart';
import 'package:hackatanga_project/screens/login/components/fade_slide_transition.dart';
import 'package:hackatanga_project/screens/login/login_controller.dart';
import 'package:hackatanga_project/screens/register/register.dart';
import 'package:hackatanga_project/screens/register/terms_of_use.dart';
import 'package:hackatanga_project/screens/tour/constants.dart';

class LoginForm extends StatelessWidget {
  final Animation<double> animation;
  final LoginController loginController;

  const LoginForm({
    @required this.animation,
    this.loginController,
  }) : assert(animation != null);

  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height;
    var space = height > 650 ? kSpaceM : kSpaceS;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        children: <Widget>[
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: CustomInputField(
              label: 'CPF',
              prefixIcon: Icons.person,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: space,
            child: CustomInputField(
              label: 'Senha',
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 2 * space,
            child: CustomButton(
              color: kBlue,
              textColor: kWhite,
              text: 'Entrar',
              onPressed: () {},
            ),
          ),
          SizedBox(height: 2 * space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 3 * space,
            child: CustomButton(
              color: kWhite,
              textColor: kBlack.withOpacity(0.5),
              text: 'Entrar com Google',
              image: Image(
                image: AssetImage(kGoogleLogoPath),
                height: 48.0,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return TermsOfUses();
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 4 * space,
            child: CustomButton(
              color: kBlack,
              textColor: kWhite,
              text: 'Crie uma conta',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Register(screenHeight: MediaQuery.of(context).size.height);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
