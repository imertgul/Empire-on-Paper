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
  List<Player> myPlayers = new List<Player>.filled(
    2,
    Player(name: "Player 1", color: Colors.red),
    growable: true,
  );

  @override
  Widget build(BuildContext context) {
    //initialize map settings from json and set the screen after
    mapSettings = jsonDecode(mapSettingsJson);
    mapSettings["width"] = MediaQuery.of(context).size.width;
    mapSettings["height"] = MediaQuery.of(context).size.height;
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
                            numbOfPlayers = value.toInt();
                          });
                          myPlayers = new List<Player>.filled(
                            numbOfPlayers,
                            Player(name: "Player 1", color: Colors.red),
                            growable: true,
                          );
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
