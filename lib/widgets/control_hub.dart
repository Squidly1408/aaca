// packages
import 'package:aaca/pages/settings/general/voice_setting.dart';
import 'package:flutter/material.dart';

// Pages
import '../pages/settings.dart';

class ControlHub extends StatefulWidget {
  const ControlHub({super.key});

  @override
  State<ControlHub> createState() => _ControlHubState();
}

String spokenText = '';
var textNotifier = ValueNotifier(0);
Color controlHubBGColour = const Color(0x77171717);
Color controlHubIconColour = const Color(0xffffffff);
bool ifSavedText = true;
Color savedTextColor = const Color(0xffffffff);

class _ControlHubState extends State<ControlHub> {
// saved text string list
  final _savedText = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 18),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        // background card
        child: Card(
          // card colour / opacity
          color: controlHubBGColour,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: ifSavedText
                  ? MediaQuery.of(context).size.height * 0.2
                  : MediaQuery.of(context).size.height * 0.15,
              // main row
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // buttons section one
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // logo
                          SizedBox(
                            height: 60,
                            child: Image.asset('lib/assets/images/logo.png',
                                fit: BoxFit.fitHeight,
                                color: controlHubIconColour),
                          ),
                          // settings button
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Settings()),
                              );
                            },
                            icon: Icon(
                              Icons.settings,
                              color: controlHubIconColour,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      // main text area
                      MaterialButton(
                        onPressed: () {
                          speak(spokenText);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(18)),
                          height: MediaQuery.of(context).size.height * 0.125,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: ValueListenableBuilder(
                                valueListenable: textNotifier,
                                builder: (context, value, child) {
                                  return Text(
                                    spokenText,
                                    style: const TextStyle(fontSize: 20),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      // buttons section two
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Text button
                          IconButton(
                            onPressed: () {
                              setState(() {
                                spokenText = '';
                                textNotifier.value = textNotifier.value + 1;
                              });
                            },
                            icon: Icon(
                              Icons.delete,
                              color: controlHubIconColour,
                              size: 30,
                            ),
                          ),
                          // save button
                          IconButton(
                            onPressed: () {
                              if (_savedText.length >= 5) {
                                setState(() {
                                  _savedText.removeAt(0);
                                });
                              }
                              setState(() {
                                _savedText.add(spokenText);
                              });
                              speak(spokenText);
                            },
                            icon: Icon(
                              Icons.message,
                              color: controlHubIconColour,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // saved text section
                  Visibility(
                    visible: ifSavedText,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: ListView.builder(
                        itemCount: _savedText.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return TextButton(
                            onPressed: () {
                              speak(_savedText[index]);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                _savedText[index].toString(),
                                style: TextStyle(
                                  color: savedTextColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
