import 'package:flutter/cupertino.dart';

class Player {
  String name;
  Color color;
  int points;

  Player({@required this.name, @required this.color, this.points = 0});
}
