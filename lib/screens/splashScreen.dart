import 'package:flutter/material.dart';
import 'package:flutter_apk_store/screens/homePage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Stack(
        alignment: Alignment.center,
        children: [
          // Increased the image height for a larger space
          Image.asset('assets/pic1.png', height: 250.0),
          const SizedBox(height: 24.0),
        ],
      ),
      // Adjust the splashIconSize if needed
      splashIconSize: 250,
      nextScreen: HomePage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      // Assuming the themeRed1 is a placeholder for the actual color from the uploaded image
      backgroundColor: Colors.black, // Adjust to match the color from the image
      duration: 3000,
    );
  }
}
