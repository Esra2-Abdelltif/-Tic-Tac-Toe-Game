import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tic_tac_toe/NewGame/NewGame2P.dart';
import 'package:tic_tac_toe/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Container(
                child: Text('Tec Tac Toe',
                    style: myNewFontWhite.copyWith(fontSize: 30))),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: AvatarGlow(
              endRadius: 140,
              duration: Duration(seconds: 2),
              glowColor: Colors.white,
              repeat: true,
              repeatPauseDuration: Duration(seconds: 1),
              startDelay: Duration(seconds: 1),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.none,
                    ), // Border.all

                    shape: BoxShape.circle), // BoxDecoration

                child: CircleAvatar(
                  backgroundColor: Colors.grey[900],

                  child: Container(
                    child: Image.asset(
                      'assests/images/tic_tac_toe.png',
                      fit: BoxFit.scaleDown,
                    ), // Image.asset
                  ), // Container radius: 80.0,
                ), // CircleAvatar
              ), // Container
            ), // AvatarGlow
          ),
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewGame2P()),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(left: 40, right: 40, bottom: 60),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(30),
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "PLAY GAME",
                      style: myNewFont,
                    ), // Text
                  ), // Center // Container
                ), // ClipRRect 1. //
              ),
            ))
      ]),
    ));
  }
}
