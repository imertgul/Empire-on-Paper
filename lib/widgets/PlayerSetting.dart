import 'package:flutter/material.dart';
import 'package:map_game/models/player.dart';
import 'package:o_popup/o_popup.dart';
import 'package:o_color_picker/o_color_picker.dart';

typedef OnColorSelected = void Function(Player);

class PlayerSetter extends StatefulWidget {
  final int index;
  final Color color;
  final OnColorSelected onColorSelected;
  PlayerSetter(
      {@required this.index, @required this.color, this.onColorSelected});
  @override
  _PlayerSetterState createState() => _PlayerSetterState();
}

class _PlayerSetterState extends State<PlayerSetter> {
  Color selectedColor;
  @override
  void initState() {
    super.initState();
    selectedColor = widget.color;
    widget.onColorSelected(
        new Player(name: "Player ${widget.index + 1}", color: widget.color));
  }

  @override
  Widget build(BuildContext context) {
    return OPopupTrigger(
      barrierAnimationDuration: Duration(milliseconds: 400),
      triggerWidget: ListTile(
        title: Text("Player ${widget.index}"),
        trailing: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedColor,
            ),
            child: Icon(
              Icons.colorize,
            )),
      ),
      popupContent: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: OColorPicker(
            selectedColor: selectedColor,
            colors: primaryColorsPalette,
            onColorChange: (color) {
              setState(() {
                selectedColor = color;
                widget.onColorSelected(new Player(
                    name: "Player ${widget.index + 1}", color: color));
              });
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
