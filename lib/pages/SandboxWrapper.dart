import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../utilities/constant.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SandboxWrapper extends StatefulWidget {
  final Widget child;
  final int tossAllChance;
  final int tossWinChance;
  SandboxWrapper({this.child, this.tossAllChance = 10, this.tossWinChance = 5});

  @override
  _SandboxWrapperState createState() => _SandboxWrapperState();
}

class _SandboxWrapperState extends State<SandboxWrapper> {
  int index;
  bool tossState = false;
  int playingNowIndex;

  @override
  void initState() {
    super.initState();
    myGame.setPlayNowIndex(0);
  }

  createBetDialog(BuildContext context) {
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
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      color: Colors.black87,
                      onPressed: () {
                        myGame.setPlayNowIndex(0);
                      },
                      child: Text(
                        "Black",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    FlatButton(
                      color: Colors.black87,
                      onPressed: () {
                        myGame.setPlayNowIndex(1);
                      },
                      child: Text(
                        "Green",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
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
                    "Export",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
