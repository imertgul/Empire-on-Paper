import 'dart:ui';
import 'package:flutter/material.dart';

import '../utilities/constant.dart';
import '../models/gameMap.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/game.dart';

class MyGame extends Game with TapDetector {
  Size screenSize;
  GameMap myMap = new GameMap();

  MyGame() {
    myMap.createMap();
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
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    if (d.globalPosition.dx >= screenCenterX - 75 &&
        d.globalPosition.dx <= screenCenterX + 75 &&
        d.globalPosition.dy >= screenCenterY - 75 &&
        d.globalPosition.dy <= screenCenterY + 75) {
      print("specified area clicked");
    }
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
