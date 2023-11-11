// package
import 'package:aaca/widgets/control_hub.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ControlBarTheming extends StatefulWidget {
  const ControlBarTheming({super.key});

  @override
  State<ControlBarTheming> createState() => _ControlBarThemingState();
}

class _ControlBarThemingState extends State<ControlBarTheming> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Control Bar Theming'),
          // background colour picker
          const Text(
            'background colour',
          ),
          ColorPicker(
            pickerColor: controlHubBGColour,
            onColorChanged: (value) {
              setState(() {
                controlHubBGColour = value;
              });
            },
            colorPickerWidth: 300,
            pickerAreaHeightPercent: 0.7,
            enableAlpha: true,
            labelTypes: const [ColorLabelType.hsl, ColorLabelType.hsv],
            displayThumbColor: true,
            paletteType: PaletteType.hsl,
            pickerAreaBorderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
            ),
            hexInputBar: false,
          ),
          // icon colour picker
          const Text(
            'Icon Colour',
          ),
          ColorPicker(
            pickerColor: controlHubIconColour,
            onColorChanged: (value) {
              setState(() {
                controlHubIconColour = value;
              });
            },
            colorPickerWidth: 300,
            pickerAreaHeightPercent: 0.7,
            enableAlpha: true,
            labelTypes: const [ColorLabelType.hsl, ColorLabelType.hsv],
            displayThumbColor: true,
            paletteType: PaletteType.hsl,
            pickerAreaBorderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
            ),
            hexInputBar: false,
          ),
          // saved text
          const Text(
            'saved text - on / off',
          ),
          // if on or off
          Switch(
            value: ifSavedText,
            onChanged: (value) {
              setState(() {
                ifSavedText = value;
              });
            },
          ),
          // color picker for saved text
          ColorPicker(
            pickerColor: savedTextColor,
            onColorChanged: (value) {
              setState(() {
                savedTextColor = value;
              });
            },
            colorPickerWidth: 300,
            pickerAreaHeightPercent: 0.7,
            enableAlpha: true,
            labelTypes: const [ColorLabelType.hsl, ColorLabelType.hsv],
            displayThumbColor: true,
            paletteType: PaletteType.hsl,
            pickerAreaBorderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
            ),
            hexInputBar: false,
          ),
        ],
      ),
    );
  }
}
