// packages
import 'package:flutter/material.dart';

class ControlHub extends StatefulWidget {
  const ControlHub({super.key});

  @override
  State<ControlHub> createState() => _ControlHubState();
}

class _ControlHubState extends State<ControlHub> {
// save texts on/off
  final bool _saveText = true;

// saved text string list
  final _savedText = <String>[
    'Anne Spruce',
    'Michelle',
    'Jacqualine Newman-Adam',
    'Alex Newman-Adam',
    'Lucas Newman',
  ];

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
          color: const Color(0x77171717),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: _saveText
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
                                fit: BoxFit.fitHeight),
                          ),
                          // settings button
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      // main text area
                      MaterialButton(
                        onPressed: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(18)),
                          height: MediaQuery.of(context).size.height * 0.125,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child:
                                  Text('hello', style: TextStyle(fontSize: 20)),
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
                            onPressed: () {},
                            icon: const Icon(
                              Icons.message,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          // save button
                          Visibility(
                            visible: _saveText,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.save_alt,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // saved text section
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ListView.builder(
                      itemCount: _savedText.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(_savedText[index].toString(),
                                style:
                                    const TextStyle(color: Color(0xffffffff))),
                          ),
                        );
                      },
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
