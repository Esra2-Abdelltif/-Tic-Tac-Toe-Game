import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tic_tac_toe/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <String> XOText=['','','','','','','','',''];
  bool OTurn=true ;
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('333739'),

        body: Padding(
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
                //  _clearBoard();
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
                  //_clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
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


