import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: SafeArea(
        child: InteractiveViewer(
            // constrained: false,
            minScale: 0.1,
            maxScale: 5,
            boundaryMargin: EdgeInsets.all(double.infinity),
            child: widget.child),
        // child: InteractiveViewer(child: widget.child),
      ),
    );
  }
}
