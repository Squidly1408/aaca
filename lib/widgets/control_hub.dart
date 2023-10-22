// packages
import 'package:flutter/material.dart';

class ControlHub extends StatefulWidget {
  const ControlHub({super.key});

  @override
  State<ControlHub> createState() => _ControlHubState();
}

class _ControlHubState extends State<ControlHub> {
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
              height: MediaQuery.of(context).size.height * 0.15,
              // main row
              child: Row(
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
                        icon: Icon(
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
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(18)),
                      height: MediaQuery.of(context).size.height * 0.125,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('hello', style: TextStyle(fontSize: 20)),
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
                        icon: Icon(
                          Icons.message,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      // save button
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.save_alt,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
