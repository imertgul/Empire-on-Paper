import 'package:flutter/material.dart';
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
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    myGame.setPlayNowIndex(0);
  }

  createBetDialog(BuildContext context) {
    // controller.text = myGame.exportMap();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Export a map"),
          content: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(myGame.exportMap()),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              //TODO COPY CLIPBOARD
              child: Icon(AntDesign.copy1),
              color: Colors.black87,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(AntDesign.close),
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
