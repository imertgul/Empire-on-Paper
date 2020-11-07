import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/player.dart';
import '../models/gameMap.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/game.dart';
import '../utilities/constant.dart';

class MyGame extends Game with TapDetector {
  Size screenSize;
  int playNowIndex;
  List<Player> sides;
  GameMap myMap;
  List<Color> myColors =
      new List<Color>.filled(2, Colors.black87, growable: true);

  MyGame({@required this.sides, this.playNowIndex = 0}) {
    myColors[0] = Colors.black87;
    myColors[1] = Colors.lime;
    for (var i = 0; i < sides.length; i++) {
      myColors.add(sides[i].color);
    }
    myMap = new GameMap(
        colors: myColors,
        row: mapSettings['row'],
        col: mapSettings['col'],
        screenSize: new Size(mapSettings['width'], mapSettings['height']));
    myMap.createMap(fill: 1);
  }

  void setPlayNowIndex(int index) {
    this.playNowIndex = index;
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Colors.white;
    canvas.drawRect(bgRect, bgPaint);
    myMap.draw(canvas);
  }

  void update(double t) {
    // TODO: implement update
  }
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  @override
  void onTapUp(TapUpDetails d) {
    print("tap up");
    myMap.tap(d.localPosition.dx, d.localPosition.dy, playNowIndex);
  }

  @override
  void onTapDown(TapDownDetails d) {
    print("tap down");
  }

  @override
  void onTapCancel() {
    print("tap cancel");
  }
}
