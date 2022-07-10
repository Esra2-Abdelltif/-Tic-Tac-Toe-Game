import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tic_tac_toe/features/New_Game/NewGame2P.dart';
import 'package:tic_tac_toe/features/pick_your_side/pick_your_side.dart';
import 'package:tic_tac_toe/util/constant/constant.dart';

import 'package:tic_tac_toe/util/constant/constant.dart';
import 'package:tic_tac_toe/util/widgets/button.dart';

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
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center, children: [
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
              glowColor: Colors.deepPurple,
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
                  ), // Container
                   radius: 80.0,
                ), // CircleAvatar
              ), // Container
            ), // AvatarGlow
          ),
        ),
        MyButton(text: "Single Player",bottompadding: 30, onTap: (){
          NavigateTo(context: context,router:Pickyourside(ai: true,));
        }),
        MyButton(text: "With A Friend", onTap: (){
          NavigateTo(context: context,router:Pickyourside(ai: false,));
        }),

      ]),
    ));
  }
}
