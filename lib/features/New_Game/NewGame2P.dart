import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tic_tac_toe/features/Home_Screen/HomeScreen.dart';
import 'package:tic_tac_toe/util/constant/constant.dart';
import 'package:tic_tac_toe/util/style/colors.dart';
import 'package:tic_tac_toe/util/widgets/button.dart';
class NewGame2P extends StatefulWidget {
  bool OHTurn=true ;
   NewGame2P({Key? key,required this.OHTurn}) : super(key: key);

  @override
  State<NewGame2P> createState() => _NewGame2PState();
}

class _NewGame2PState extends State<NewGame2P> {
  List <String> XOText=['','','','','','','','',''];
 // bool OTurn=true ;
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0; //deh 3ashan a3ed kam box w ana bl3b w awel ma awsl Ll 9 box yb2a Draw


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Column(
          children: [
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Player X',
                            style:  myNewFontWhite,
                          ),
                          SizedBox(height: 20,),
                          Text(
                            xScore.toString(),
                            style:myNewFontWhite
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Player O',
                              style: myNewFontWhite
                          ),
                          SizedBox(height: 20,),
                          Text(
                            oScore.toString(),
                            style:  myNewFontWhite
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MyButton(text: "Turn : ${widget.OHTurn ? 'O':'X'}", onTap:(){},bottompadding: 30),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    // crossAxisSpacing: 4.0,
                    // mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){_ClickToPlay(index);},
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1,color: Colors.purple.shade700)
                        ),
                        child:Center(
                            child: Text(XOText[index],style: TextStyle(fontSize: 50),)),
                      ),
                    );
                  },


                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                FloatingActionButton(
                  backgroundColor:  HexColor('7b61c9'),
                  onPressed:  _clearScoreBoard,
                  child:const Icon(
                    Icons.restart_alt_outlined,size: 40,
                  ),

                ),
                SizedBox(width: 30,),
                FloatingActionButton(
                  backgroundColor: HexColor('7b61c9'),
                  onPressed: () {
                    NavigateAndFinsh(context: context,router: HomeScreen());
                  },
                  child:const Icon(
                    Icons.home,size: 40,
                  ),

                ),


              ]
                ,),
            ),
          ],
        )

    );
  }

  void _ClickToPlay(int index){
    setState(() {
      if(widget.OHTurn && XOText[index]=='')
      {
        XOText[index]='O';
        filledBoxes++;
      }
      else if (!widget.OHTurn && XOText[index]==''){
        XOText[index]='X';
        filledBoxes++;
      }
      widget.OHTurn =!widget.OHTurn;
      _CheckWinner();
    });
  }
  void _CheckWinner(){
    if (XOText[0] == XOText[1] && XOText[0] == XOText[2] && XOText[0] != '') {
      _showWinDialog(XOText[0]);
    }
    if (XOText[3] == XOText[4] && XOText[3] == XOText[5] && XOText[3] != '') {
      _showWinDialog(XOText[3]);
    }
    if (XOText[6] == XOText[7] && XOText[6] == XOText[8] &&XOText[6] != '') {
      _showWinDialog(XOText[6]);
    }

    // Checking Column
    if (XOText[0] == XOText[3] && XOText[0] == XOText[6] && XOText[0] != '') {
      _showWinDialog(XOText[0]);
    }
    if (XOText[1] == XOText[4] && XOText[1] == XOText[7] && XOText[1] != '') {
      _showWinDialog(XOText[1]);
    }
    if (XOText[2] == XOText[5] && XOText[2] == XOText[8] && XOText[2] != '') {
      _showWinDialog(XOText[2]);
    }

    // Checking Diagonal
    if (XOText[0] == XOText[4] && XOText[0] == XOText[8] && XOText[0] != '') {
      _showWinDialog(XOText[0]);
    }
    if (XOText[2] == XOText[4] && XOText[2] == XOText[6] && XOText[2] != '') {
      _showWinDialog(XOText[2]);
    }
    else if (filledBoxes == 9) {
      _showDrawDialog();
    }

  }
  void _showWinDialog(String winner){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(" ${winner} is Winner 🥳"),
            actions: [
              FlatButton(
                child: Text("Play Again",style: TextStyle(color: defultColor)),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
  }
  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Draw"),
            actions: [
              FlatButton(
                child: Text("Play Again",style: TextStyle(color: defultColor)),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        XOText[i] = '';
      }
    });

    filledBoxes = 0;
  }
  void _clearScoreBoard() {
    setState(() {
      xScore = 0;
      oScore = 0;
      for (int i = 0; i < 9; i++) {
        XOText[i] = '';
      }
    });
    filledBoxes = 0;
  }

}
