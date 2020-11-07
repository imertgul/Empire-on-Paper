import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';

class GameMap {
  int row;
  int col;
  double width;
  double height;
  Size screenSize;
  List<Color> colors;
  var map;
  GameMap({
    this.row = 30,
    this.col = 10,
    this.map,
    this.height,
    this.width,
    @required this.screenSize,
    @required this.colors,
  }) {
    print(screenSize);
    height = screenSize.width / col;
    width = screenSize.height / row;
  }

  void createMap({int fill}) {
    map = List.generate(row, (i) => List(col), growable: false);
    for (var i = 0; i < row; i++) {
      for (var j = 0; j < col; j++) {
        map[i][j] = fill != null ? fill : Random().nextInt(2);
      }
    }
  }

  void draw(canvas) {
    for (var i = 0; i < row; i++) {
      for (var j = 0; j < col; j++) {
        Rect bgRect = Rect.fromLTWH(i * width, j * height, width, height);
        Paint bgPaint = Paint();
        bgPaint.color = colors[map[i][j]];
        canvas.drawRect(bgRect, bgPaint);
      }
    }
  }

  void tap(double dx, double dy, int tapper) {
    map[((dx - (dx % width)) / width).ceil()]
        [((dy - (dy % height)) / height).ceil()] = tapper;
  }
}
