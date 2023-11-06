// packages
import 'package:aaca/widgets/control_hub.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VoiceSetting extends StatefulWidget {
  const VoiceSetting({super.key});

  @override
  State<VoiceSetting> createState() => _VoiceSettingState();
}

double _volume = 0.5;
double _pitch = 1.0;
double _rate = 0.5;

var flutterTts = FlutterTts();

Future speak(text) async {
  await flutterTts.setVolume(_volume);
  await flutterTts.setSpeechRate(_rate);
  await flutterTts.setPitch(_pitch);

  if (spokenText!.isNotEmpty) {
    await flutterTts.speak(text);
  }
}

class _VoiceSettingState extends State<VoiceSetting> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Voice Settings'),
          const Text('Volume'),
          Slider(
            value: _volume,
            onChanged: (value) {
              setState(() {
                _volume = value;
              });
            },
            max: 1.0,
            min: 0.1,
            divisions: 18,
            label: 'Volume',
          ),
          const Text('Rate'),
          Slider(
            value: _rate,
            onChanged: (value) {
              setState(() {
                _rate = value;
              });
            },
            max: 1.0,
            min: 0.1,
            divisions: 18,
            label: 'Rate',
          ),
          const Text('Pitch'),
          Slider(
            value: _pitch,
            onChanged: (value) {
              setState(() {
                _pitch = value;
              });
            },
            max: 1.0,
            min: 0.1,
            divisions: 18,
            label: 'Pitch',
          ),
        ],
      ),
    );
  }
}
