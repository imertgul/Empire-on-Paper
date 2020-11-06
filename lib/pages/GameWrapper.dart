import 'package:flutter/material.dart';
import '../utilities/constant.dart';

class GameWrapper extends StatefulWidget {
  final Widget child;
  GameWrapper({this.child});

  @override
  _GameWrapperState createState() => _GameWrapperState();
}

class _GameWrapperState extends State<GameWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Hello"),
      // ),
      body: SafeArea(
        child: InteractiveViewer(
            minScale: 1,
            maxScale: 5,
            boundaryMargin: EdgeInsets.all(double.infinity),
            child: widget.child),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          FlatButton(
              onPressed: () => myGame.setPlayNowIndex(0), child: Text("0")),
          FlatButton(
              onPressed: () => myGame.setPlayNowIndex(1), child: Text("1")),
          FlatButton(
              onPressed: () => myGame.setPlayNowIndex(2), child: Text("2")),
          FlatButton(
              onPressed: () => myGame.setPlayNowIndex(3), child: Text("3")),
          FlatButton(
              onPressed: () => myGame.setPlayNowIndex(4), child: Text("4")),
        ],
      ),
    );
  }
}
