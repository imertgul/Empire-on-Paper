import 'dart:convert';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:map_game/models/player.dart';
import 'package:flutter/material.dart';
import 'package:map_game/widgets/PlayerSetting.dart';
import '../utilities/constant.dart';
import '../game/myGame.dart';
import '../models/player.dart';
import 'GameWrapper.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int numbOfPlayers = 2;
  Color selectedColor = Colors.lime;
  List<Player> myPlayers;

  @override
  void initState() {
    super.initState();
    initPlayers();
  }

  void initPlayers() {
    myPlayers = new List<Player>();
    myPlayers.add(Player(name: "Player 1", color: Colors.red));
    myPlayers.add(Player(name: "Player 2", color: Colors.blue));
  }

  @override
  Widget build(BuildContext context) {
    //initialize screen settings
    myScreen = new Size(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 75.0),
                      child: SpinBox(
                        min: 2,
                        max: 10,
                        value: numbOfPlayers.toDouble(),
                        decoration:
                            InputDecoration(labelText: 'Number of Players'),
                        onChanged: (value) {
                          setState(() {
                            initPlayers();
                            numbOfPlayers = value.toInt();
                          });
                          for (var i = 2; i < numbOfPlayers; i++) {
                            myPlayers.add(new Player(
                                name: "Player ${i + 1}", color: Colors.red));
                          }
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        myGame = new MyGame(sides: myPlayers);
                        //STARTS THE GAME
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    GameWrapper(child: myGame.widget)));
                      },
                      child: Text("Start"),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: numbOfPlayers,
                    itemBuilder: (BuildContext context, int index) {
                      return PlayerSetter(
                        index: index,
                        color: myPlayers[index].color,
                        onColorSelected: (player) {
                          myPlayers[index] = player;
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
