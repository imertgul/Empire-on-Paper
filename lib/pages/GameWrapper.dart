import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import '../utilities/constant.dart';

class GameWrapper extends StatefulWidget {
  final Widget child;
  GameWrapper({this.child});

  @override
  _GameWrapperState createState() => _GameWrapperState();
}

class _GameWrapperState extends State<GameWrapper> {
  int index;
  bool tossState = false;
  int playerCount;
  int playingNowIndex;

  @override
  void initState() {
    super.initState();
    playerCount = myGame.sides.length;
    playingNowIndex = rollDice(playerCount);
    myGame.setPlayNowIndex(playingNowIndex + 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            InteractiveViewer(
              minScale: 0.5,
              maxScale: 5,
              boundaryMargin: EdgeInsets.all(double.infinity),
              child: widget.child,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context)),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    tossState = toss(10, 5);
                  });
                },
                child: Text("Toss: ${tossState ? "heads" : "tails"}"),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: myGame.sides[playingNowIndex].color,
                  ),
                  child:
                      Center(child: Text(myGame.sides[playingNowIndex].name)),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
              onPressed: () => myGame.setPlayNowIndex(0), child: Text("0")),
          FlatButton(
              onPressed: () => myGame.setPlayNowIndex(1), child: Text("1")),
          FlatButton(
            onPressed: () {
              setState(() {
                playingNowIndex = nextTurn(playingNowIndex, playerCount);
                myGame.setPlayNowIndex(playingNowIndex + 2);
              });
            },
            child: Text("Next Turn"),
          ),
        ],
      ),
    );
  }
}

int nextTurn(int playingNow, int length) {
  print("Now: $playingNow , length: $length");
  return playingNow < length - 1 ? playingNow + 1 : 0;
}
