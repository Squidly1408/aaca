// packages
import 'package:flutter/material.dart';

// widgets
import '../widgets/control_hub.dart';

// pages

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // stack for background image / main page
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('lib/assets/images/background.png', fit: BoxFit.fill),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Column(
                children: [
                  ControlHub(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
