import 'package:aaca/data/apps_list.dart';
import 'package:aaca/pages/settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'general/about_app.dart';

class AppsSetting extends StatefulWidget {
  const AppsSetting(
      {super.key,
      required this.text,
      required this.index,
      required this.update});

  final String text;
  final int index;
  final ValueListenable<int> update;

  @override
  State<AppsSetting> createState() => _AppsSettingState();
}

var notifier = ValueNotifier(0);

class _AppsSettingState extends State<AppsSetting> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    TextEditingController _newText =
        TextEditingController(text: appList[widget.index].text);

    return Center(
      child: Column(
        children: [
          Text('apps setting ${widget.text}, ${widget.index}'),
          MaterialButton(
            onPressed: () {
              setState(() {
                appList.removeAt(widget.index);
                setting = const AboutApp();
                notifier1.value = !notifier1.value;
                notifier.value = notifier.value + 1;
              });
            },
            child: const Text('Delete'),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      appList[widget.index].icon = Icons.text_fields_outlined;
                      setting = AboutApp();
                      notifier.value = notifier.value + 1;
                    });
                  },
                  icon: const Icon(Icons.text_fields_outlined),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      appList[widget.index].icon = Icons.tag_faces;
                      notifier.value = notifier.value + 1;
                    });
                  },
                  icon: const Icon(Icons.tag_faces),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      appList[widget.index].icon = Icons.tag;
                      notifier.value = notifier.value + 1;
                    });
                  },
                  icon: const Icon(Icons.tag),
                ),
              ],
            ),
          ),
          TextField(
            controller: _newText,
            keyboardType: TextInputType.text,
            maxLength: 30,
            onSubmitted: (value) {
              setState(() {
                appList[widget.index].text = _newText.text;
                notifier.value = notifier.value + 1;
              });
            },
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                appList[widget.index].text = _newText.text;
                notifier.value = notifier.value + 1;
              });
            },
            child: const Text('submit'),
          )
        ],
      ),
    );
  }
}
