
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/HomeScreen/HomeScreen.dart';
class SplashSCreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor:Colors.grey.shade700,
      duration: 400,
      splash: Column(children: [
        Image.asset('assests/images/tic_tac_toe.png',width: 250,height: 250),

      ]),
      nextScreen:  HomeScreen(),
      splashIconSize: 250,
      splashTransition: SplashTransition.slideTransition,


    );

  }
}
