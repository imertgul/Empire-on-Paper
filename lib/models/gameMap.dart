import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';

class GameMap {
  int row;
  int col;
  double width;
  double height;
  double resolution;
  Color colorEmpty;
  Color colorFill;
  var map;
  GameMap({
    this.row = 10,
    this.col = 10,
    this.map,
    this.height = 20,
    this.width = 20,
    this.resolution = 20,
    this.colorEmpty = Colors.lime,
    this.colorFill = Colors.black87,
  });

  void createMap({fill}) {
    map = List.generate(row, (i) => List(col), growable: false);
    for (var i = 0; i < row; i++) {
      for (var j = 0; j < col; j++) {
        map[i][j] = fill != null ? fill : Random().nextInt(2);
      }
    }
    print(map);
  }

  void draw(canvas) {
    for (var i = 0; i < row; i++) {
      for (var j = 0; j < col; j++) {
        Rect bgRect =
            Rect.fromLTWH(i * resolution, j * resolution, width, height);
        Paint bgPaint = Paint();
        bgPaint.color = map[i][j] == 1 ? colorFill : colorEmpty;
        canvas.drawRect(bgRect, bgPaint);
      }
    }
  }

  void tap(double dx, double dy) {
    map[((dx - (dx % resolution)) / resolution).ceil()]
        [((dy - (dy % resolution)) / resolution).ceil()] ^= 1;
  }
}
