import 'dart:math';
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
  int zar = 6;
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
                    zar = Random().nextInt(6);
                  });
                },
                child: Text("Zar At: ${zar > 3 ? "başarılı" : "Kaybettin"}"),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 50,
                width: 150,
                child: SpinBox(
                  min: 1,
                  max: myGame.sides.length.toDouble(),
                  value: 1,
                  onChanged: (value) =>
                      myGame.setPlayNowIndex(value.toInt() + 1),
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
        ],
      ),
    );
  }
}
