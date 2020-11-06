import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:map_game/models/player.dart';
import 'package:o_popup/o_popup.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:flutter/material.dart';
import '../utilities/constant.dart';
import 'GameWrapper.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int players = 2;
  Color selectedColor = Colors.lime;
  List<Player> myPlayers =
      new List<Player>.filled(1, Player(name: "Player 1", color: Colors.red));

  Widget colorPicker(int index) {
    return OPopupTrigger(
      barrierAnimationDuration: Duration(milliseconds: 400),
      triggerWidget:
          Container(color: selectedColor, child: Icon(Icons.colorize)),
      popupContent: OColorPicker(
        selectedColor: myPlayers[index].color,
        colors: primaryColorsPalette,
        onColorChange: (color) {
          setState(() {
            myPlayers[index].color = color;
          });
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    SpinBox(
                      min: 1,
                      max: 10,
                      value: 1,
                      decoration:
                          InputDecoration(labelText: 'Number of Players'),
                      onChanged: (value) {
                        setState(() {
                          players = value.toInt();
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GameWrapper(child: myGame.widget))),
                      child: Text("Start"),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: players,
                    itemBuilder: (BuildContext context, int index) {
                      myPlayers = new List<Player>.filled(index,
                          Player(name: "Player $index", color: Colors.red));
                      return colorPicker(index);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
