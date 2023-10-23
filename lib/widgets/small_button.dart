import 'package:flutter/material.dart';

class SmallButton extends StatefulWidget {
  const SmallButton({
    super.key,
    required this.backgroundColour,
    required this.text,
    required this.textColour,
    required this.icon,
    required this.iconColour,
  });
  // main app data:
  // background colour
  final Color backgroundColour;

  // text data:
  // main text
  final String text;
  // text colour
  final Color textColour;

  // icon data:
  // icon type
  final IconData icon;
  // icon colour
  final Color iconColour;

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: widget.backgroundColour,
              ),
              height: 50,
              width: 50,
              child: Icon(
                widget.icon,
                color: widget.iconColour,
              ),
            ),
            Text(
              widget.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: widget.textColour,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
