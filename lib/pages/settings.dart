// Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// pages
import 'home.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

ValueNotifier<bool> _notifier = ValueNotifier(false);

Widget _setting = const _AboutApp();

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
                        setting: _AboutApp(),
                      ),
                      _CustomListTile(
                        title: "Parental Lock",
                        icon: CupertinoIcons.lock_shield,
                        setting: _ParentalLock(),
                      ),
                      _CustomListTile(
                        title: "Control Bar",
                        icon: Icons.table_chart,
                        setting: _ParentalLock(),
                      ),
                      _CustomListTile(
                        title: "Voice settings",
                        icon: CupertinoIcons.volume_up,
                        setting: _ParentalLock(),
                      ),
                    ],
                  ),
                  const _SingleSection(
                    title: "Theming ",
                    children: [
                      _CustomListTile(
                        title: "General Apps",
                        icon: Icons.widgets,
                        setting: _ParentalLock(),
                      ),
                      _CustomListTile(
                        title: "Background",
                        icon: CupertinoIcons
                            .rectangle_fill_on_rectangle_angled_fill,
                        setting: _ParentalLock(),
                      ),
                      _CustomListTile(
                        title: "Control Bar",
                        icon: Icons.table_chart,
                        setting: _ParentalLock(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const VerticalDivider(thickness: 3),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _notifier,
                builder: (context, value, child) {
                  return _setting;
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
          _setting = widget.setting;
        });
        _notifier.value = !_notifier.value;
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

class _AboutApp extends StatefulWidget {
  const _AboutApp({super.key});

  @override
  State<_AboutApp> createState() => __AboutAppState();
}

class __AboutAppState extends State<_AboutApp> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('About app'),
    );
  }
}

class _ParentalLock extends StatefulWidget {
  const _ParentalLock({super.key});

  @override
  State<_ParentalLock> createState() => __ParentalLockState();
}

class __ParentalLockState extends State<_ParentalLock> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Parental Lock'),
    );
  }
}
