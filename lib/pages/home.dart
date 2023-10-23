// packages
import 'package:flutter/material.dart';

// widgets
import '../widgets/control_hub.dart';
import '../widgets/small_button.dart';

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
              child: Column(
                children: [
                  const ControlHub(),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (MediaQuery.of(context).size.width / 120)
                          .floor()
                          .toInt(),
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return const Center(
                        child: SmallButton(
                          backgroundColour: Color(0x77171717),
                          text: 'testing text',
                          textColour: Colors.white,
                          icon: Icons.tag_faces_outlined,
                          iconColour: Colors.white,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
