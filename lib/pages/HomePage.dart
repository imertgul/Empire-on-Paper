import 'package:flutter/material.dart';
import '../models/player.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          IconButton(icon: Icon(Icons.menu), onPressed: null),
        ],
      ),
    );
  }
}
