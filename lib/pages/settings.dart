// Packages
import 'package:aaca/models/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// pages
import '../data/apps_list.dart';
import 'home.dart';

// setting pages
import 'settings/apps.dart';
import 'settings/general/about_app.dart';
import 'settings/general/control_bar.dart';
import 'settings/general/parental_lock.dart';
import 'settings/general/voice_setting.dart';
import 'settings/theming/background.dart';
import 'settings/theming/control_bar.dart';
import 'settings/theming/general_apps.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

ValueNotifier<bool> notifier1 = ValueNotifier(false);

Widget setting = const AboutApp();

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
                        },
                        label: const Text('Back'),
                        icon: const Icon(Icons.arrow_back_ios)),
                  ),
                  const _SingleSection(
                    title: "General",
                    children: [
                      _CustomListTile(
                        title: "About App",
                        icon: Icons.tablet_mac,
                        setting: AboutApp(),
                      ),
                      _CustomListTile(
                        title: "Parental Lock",
                        icon: CupertinoIcons.lock_shield,
                        setting: ParentalLock(),
                      ),
                      _CustomListTile(
                        title: "Control Bar",
                        icon: Icons.table_chart,
                        setting: ControlBar(),
                      ),
                      _CustomListTile(
                        title: "Voice settings",
                        icon: CupertinoIcons.volume_up,
                        setting: VoiceSetting(),
                      ),
                    ],
                  ),
                  const _SingleSection(
                    title: "Theming ",
                    children: [
                      _CustomListTile(
                        title: "General Apps",
                        icon: Icons.widgets,
                        setting: GeneralAppTheming(),
                      ),
                      _CustomListTile(
                        title: "Background",
                        icon: CupertinoIcons
                            .rectangle_fill_on_rectangle_angled_fill,
                        setting: Background(),
                      ),
                      _CustomListTile(
                        title: "Control Bar",
                        icon: Icons.table_chart,
                        setting: ControlBarTheming(),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Apps',
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(fontSize: 16),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          children: [
                            ValueListenableBuilder(
                              valueListenable: appNotifier,
                              builder: (context, value, child) {
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return ListenableBuilder(
                                      listenable: appNotifier,
                                      builder: (context, child) {
                                        return _CustomListTile(
                                          title: appList[index].text,
                                          icon: appList[index].icon,
                                          setting: AppsSetting(
                                              text: appList[index].text,
                                              index: index,
                                              update: appNotifier),
                                        );
                                      },
                                    );
                                  },
                                  itemCount: appList.length,
                                );
                              },
                            ),
                            ValueListenableBuilder(
                              valueListenable: appNotifier,
                              builder: (context, value, child) {
                                return Column(
                                  children: [
                                    Visibility(
                                      visible:
                                          appList.length >= 40 ? true : false,
                                      child: const Center(
                                        child: Text(
                                            'Maximum Amount of Buttons Reached!'),
                                      ),
                                    ),
                                    Visibility(
                                      visible:
                                          appList.length < 40 ? true : false,
                                      child: Center(
                                        child: MaterialButton(
                                          child: const Icon(Icons.add),
                                          onPressed: () {
                                            setState(() {
                                              if (appList.length < 40) {
                                                appList.add(
                                                  App('New App',
                                                      Icons.now_widgets),
                                                );
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const VerticalDivider(thickness: 3),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: notifier1,
                builder: (context, value, child) {
                  return setting;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final Widget setting;
  const _CustomListTile(
      {Key? key,
      required this.title,
      required this.icon,
      this.trailing,
      required this.setting})
      : super(key: key);

  @override
  State<_CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<_CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      leading: Icon(widget.icon),
      trailing: widget.trailing ?? const Icon(CupertinoIcons.forward, size: 18),
      onTap: () {
        setState(() {
          setting = widget.setting;
        });
        notifier1.value = !notifier1.value;
      },
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title.toUpperCase(),
            style:
                Theme.of(context).textTheme.headline3?.copyWith(fontSize: 16),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
