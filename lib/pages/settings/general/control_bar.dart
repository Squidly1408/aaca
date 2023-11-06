// packages
import 'package:flutter/material.dart';

class ControlBar extends StatefulWidget {
  const ControlBar({super.key});

  @override
  State<ControlBar> createState() => _ControlBarState();
}

class _ControlBarState extends State<ControlBar> {
  bool saveText = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'Control Bar',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Save Text Switch'),
              Switch(
                value: saveText,
                onChanged: (value) {},
              )
            ],
          )
        ],
      ),
    );
  }
}
