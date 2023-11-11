// packages
import 'package:aaca/data/default_theming.dart';
import 'package:flutter/material.dart';

// widgets
import '../data/apps_list.dart';
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
          alignment: AlignmentDirectional.topCenter,
          children: [
            // background image
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset('lib/assets/images/background.png',
                  fit: BoxFit.cover),
            ),
            // gridview.builder of apps
            Column(
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
                  itemCount: appList.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: SmallButton(
                        backgroundColour: const Color(0x77171717),
                        text: appList[index].text,
                        textColour: appList[index].individual
                            ? appList[index].txtColour
                            : defaultTheming[0].txtColour,
                        icon: appList[index].icon,
                        iconColour: appList[index].individual
                            ? appList[index].mnColour
                            : defaultTheming[0].mnColour,
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
