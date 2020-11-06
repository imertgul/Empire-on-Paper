import 'package:flutter/material.dart';
import '../utilities/constant.dart';
import '../utilities/constant.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  HomePage({this.child});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
