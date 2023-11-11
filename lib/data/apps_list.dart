// packages
import 'package:flutter/material.dart';

// models
import '../models/app.dart';

// list of apps
final appList = [
  App(
    icon: Icons.widgets,
    id: 0,
    text: 'helo',
    individual: false,
    bgColour: const Color(0xffff0000),
    mnColour: const Color(0xff0000ff),
    txtColour: const Color(0xff00ff00),
  ),
  App(
    icon: Icons.widgets,
    id: 0,
    text: 'helo',
    individual: true,
    bgColour: const Color(0xffff0000),
    mnColour: const Color(0xff0000ff),
    txtColour: const Color(0xff00ff00),
  ),
];
