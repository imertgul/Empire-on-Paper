import 'package:map_game/models/Player.dart';
import 'package:flutter/material.dart';
import 'package:map_game/widgets/PlayerSetting.dart';
import '../utilities/constant.dart';
import '../game/MyGame.dart';
import '../models/Player.dart';
import 'GameWrapper.dart';

class LobbyPage extends StatefulWidget {
  final int numbOfPlayers;

  LobbyPage({this.numbOfPlayers = 2});
  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  int numbOfPlayers;
  Color selectedColor = Colors.lime;
  List<Player> myPlayers;

  @override
  void initState() {
    super.initState();
    numbOfPlayers = widget.numbOfPlayers;
    initPlayers(numbOfPlayers);
  }

  void initPlayers(int length) {
    myPlayers = new List<Player>();
    for (var i = 0; i < length; i++) {
      myPlayers.add(Player(name: "Player $i", color: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    //initialize screen settings

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context)),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(children: [
                      Text("Import a Map as JSON"),
                      TextField(
                        onChanged: (value) {
                          mapSettingsJson = value;
                        },
                      ),
                    ]),
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
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  //Sends players to game
                  myGame =
                      new MyGame(sides: myPlayers, mapJson: mapSettingsJson);
                  //STARTS THE GAME
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameWrapper(child: myGame.widget),
                    ),
                  );
                },
                child: Text("Start"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
