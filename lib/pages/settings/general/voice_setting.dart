import 'package:flutter/cupertino.dart';

class VoiceSetting extends StatefulWidget {
  const VoiceSetting({super.key});

  @override
  State<VoiceSetting> createState() => _VoiceSettingState();
}

class _VoiceSettingState extends State<VoiceSetting> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Voice Settings'),
    );
  }
}
