import 'package:flutter/material.dart';
import 'package:tic_tac_toe/features/New_Game/NewGame2P.dart';
import 'package:tic_tac_toe/features/SinglePlayer/SinglePlayer.dart';
import 'package:tic_tac_toe/util/widgets/oh.dart';
import 'package:tic_tac_toe/util/constant/constant.dart';
import 'package:tic_tac_toe/util/widgets/button.dart';
import 'package:tic_tac_toe/util/widgets/x.dart';

class Pickyourside extends StatefulWidget {
  bool ai=true;

   Pickyourside({Key? key ,required this.ai}) : super(key: key);

  @override
  State<Pickyourside> createState() => _PickyoursideState();
}

class _PickyoursideState extends State<Pickyourside> {
  bool IsOh=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Container(
                  child: Text('${widget.ai ? 'Pick your side':'Choose Frist Player'}', style: myNewFontWhite.copyWith(fontSize: 15))),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 80),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            IsOh=true;
                          });
                        },
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: IsOh?  Colors.grey.shade300:Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                           OH(size: 120, color: Colors.purple.shade400)

                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                           IsOh=false;
                          });
                        },
                        child: Container(
                          height: 250,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: IsOh? Colors.white: Colors.grey.shade300,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              EX(size: 120,height:  20)
                            ],
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 50,),
              MyButton(text: "Continue", onTap: (){
            NavigateAndFinsh(context: context,router:widget.ai? SinglePlayer():NewGame2P(OHTurn: IsOh,));
          }),

        ]),
      ),
    );
  }
}
