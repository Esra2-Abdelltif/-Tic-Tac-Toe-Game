import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tic_tac_toe/constant.dart';
class NewGame2P extends StatefulWidget {
  const NewGame2P({Key? key}) : super(key: key);

  @override
  State<NewGame2P> createState() => _NewGame2PState();
}

class _NewGame2PState extends State<NewGame2P> {
  List <String> XOText=['','','','','','','','',''];
  bool OTurn=true ;
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0; //deh 3ashan a3ed kam box w ana bl3b w awel ma awsl Ll 9 box yb2a Draw


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('333739'),

        body: Column(

          children: [
            SizedBox(height: 15,),
            Expanded(
              // creating the ScoreBoard
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
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                            border: Border.all(width: 1,color: Colors.grey.shade700)
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

              // Button for Clearing the Enter board
              // as well as Scoreboard to start allover again
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.indigo[50],
                        textColor: Colors.black,
                        onPressed: _clearScoreBoard,
                        child: Text("Clear Score Board"),
                      ),
                    ],
                  ),
                ))


          ],
        )

    );
  }

  void _ClickToPlay(int index){

    setState(() {
      if(OTurn && XOText[index]=='')
      {
        XOText[index]='O';
        filledBoxes++;
      }
      else if ( !OTurn && XOText[index]==''){
        XOText[index]='X';
        filledBoxes++;
      }
      OTurn =!OTurn;
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
            title: Text("\" " + winner + " \" is Winner!!!"),
            actions: [
              FlatButton(
                child: Text("Play Again"),
                onPressed: () {
                  OTurn =true;
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
                child: Text("Play Again"),
                onPressed: () {
                  OTurn =true;
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
  void _winning(board, player){
    if (
    (board[0] == player && board[1] == player && board[2] == player) ||
        (board[3] == player && board[4] == player && board[5] == player) ||
        (board[6] == player && board[7] == player && board[8] == player) ||
        (board[0] == player && board[3] == player && board[6] == player) ||
        (board[1] == player && board[4] == player && board[7] == player) ||
        (board[2] == player && board[5] == player && board[8] == player) ||
        (board[0] == player && board[4] == player && board[8] == player) ||
        (board[2] == player && board[4] == player && board[6] == player)
    ) {
      // return true;
    } else {
      //return false;
    }
  }
}
