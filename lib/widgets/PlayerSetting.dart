import 'package:flutter/material.dart';
import 'package:map_game/models/player.dart';
import 'package:o_popup/o_popup.dart';
import 'package:o_color_picker/o_color_picker.dart';

typedef OnColorSelected = void Function(Player);

class PlayerSetter extends StatefulWidget {
  final int index;
  final OnColorSelected onColorSelected;
  PlayerSetter({@required this.index, this.onColorSelected});
  @override
  _PlayerSetterState createState() => _PlayerSetterState();
}

class _PlayerSetterState extends State<PlayerSetter> {
  Color selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return OPopupTrigger(
      barrierAnimationDuration: Duration(milliseconds: 400),
      triggerWidget:
          Container(color: selectedColor, child: Icon(Icons.colorize)),
      popupContent: Center(
        child: OColorPicker(
          selectedColor: selectedColor,
          colors: primaryColorsPalette,
          onColorChange: (color) {
            setState(() {
              selectedColor = color;
              widget.onColorSelected(
                  new Player(name: "Player ${widget.index}", color: color));
            });
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}