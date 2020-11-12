import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../utilities/constant.dart';
import 'package:flutter_icons/flutter_icons.dart';

class GameWrapper extends StatefulWidget {
  final Widget child;
  final int tossAllChance;
  final int tossWinChance;
  GameWrapper({this.child, this.tossAllChance = 10, this.tossWinChance = 5});

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

  nextTurn() {
    playingNowIndex = nextPlayer(playingNowIndex, playerCount);
    myGame.setPlayNowIndex(playingNowIndex + 2);
  }
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Place a Bet"),
          content: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SpinBox(
                  min: 1.0,
                  value: 1,
                  max: 100.0,
                  decoration: InputDecoration(labelText: 'Area'),
                  onChanged: (value) => print(value),
                ),
                ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 20.0,
                  activeBgColor: Colors.lime,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.black87,
                  inactiveFgColor: Colors.white,
                  labels: ['Heads', 'Tails'],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Icon(AntDesign.close),
              color: Colors.black87,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                tossState = toss(widget.tossAllChance, widget.tossWinChance);
                createTossDialog(context);
              },
              child: Icon(AntDesign.check),
              color: Colors.black87,
            ),
          ],
        );
      },
    );
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
                  icon: Icon(FontAwesome.arrow_left),
                  onPressed: () => Navigator.pop(context)),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  color: Colors.black87,
                  onPressed: () {
                    setState(() {
                      nextTurn();
                    });
                  },
                  child: Text(
                    "Next Turn",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed: () => createBetDialog(context),
                  child: Text(
                    "Place a bet",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.black87,
                ),
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
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                      color: myGame.sides[playingNowIndex]
                          .color, //                   <--- border color
                      width: 5.0,
                    ),
                    color: Colors.black87,
                  ),
                  child: Center(
                      child: Text(
                    myGame.sides[playingNowIndex].name,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int nextPlayer(int playingNow, int length) {
  print("Now: $playingNow , length: $length");
  return playingNow < length - 1 ? playingNow + 1 : 0;
}
