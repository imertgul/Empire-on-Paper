import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:map_game/pages/GameWrapper.dart';
import 'package:map_game/pages/WelcomePage.dart';
import 'game/myGame.dart';
import './models/player.dart';
import './utilities/constant.dart';

List<Player> sides = new List<Player>(3);
void initialize() {
  sides[0] = new Player(name: "Alliance", color: Colors.blue);
  sides[1] = new Player(name: "Horde", color: Colors.red);
  sides[2] = new Player(name: "Pandas", color: Colors.green);
  myGame = MyGame(sides: sides);
}

void main() async {
  initialize();
  Util flameUtil = Util();
  runApp(MyApp());
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.landscapeLeft);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomePage(),
    );
  }
}
