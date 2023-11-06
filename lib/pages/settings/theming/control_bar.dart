// package
import 'package:flutter/cupertino.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ControlBarTheming extends StatefulWidget {
  const ControlBarTheming({super.key});

  @override
  State<ControlBarTheming> createState() => _ControlBarThemingState();
}

class _ControlBarThemingState extends State<ControlBarTheming> {
  var controlBarBackgroundColour = const Color(0x77171717);
  var controlBarIconColour = const Color(0xffffffff);
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
            pickerColor: controlBarBackgroundColour,
            onColorChanged: (value) {},
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
            pickerColor: controlBarIconColour,
            onColorChanged: (value) {},
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
