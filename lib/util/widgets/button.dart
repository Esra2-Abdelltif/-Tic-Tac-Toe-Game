import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tic_tac_toe/util/constant/constant.dart';

import '../../features/New_Game/NewGame2P.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double bottompadding ;
  const MyButton({Key? key ,required this.text ,required this.onTap,this.bottompadding =60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(left: 40, right: 40, bottom: bottompadding),
          child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                gradient: new LinearGradient(
                    colors: [
                      Colors.deepPurpleAccent,
                      Colors.deepPurple,
                      HexColor('634d98'),
                      HexColor('7b61c9'),
                    ],
                    stops: [0.1, 0.5, 0.7, 0.9],
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                    tileMode: TileMode.repeated
                )
            ),
            child: Center(
              child: Text(
                text,
                style: myNewFont.copyWith(fontSize: 13),
              ), // Text
            ), // Center // Container
          ),
        ));
  }
}
