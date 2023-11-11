// packages
import 'package:flutter/material.dart';

// app model
class App {
  // apps data
  int? id;
  String text;
  IconData icon;
  bool individual;

  // apps theming
  Color bgColour;
  Color mnColour;
  Color txtColour;

  App({
    // apps data
    this.id,
    required this.text,
    required this.icon,
    required this.individual,

    // apps theming
    required this.bgColour,
    required this.mnColour,
    required this.txtColour,
  });
}
