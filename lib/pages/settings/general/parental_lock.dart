import 'package:flutter/material.dart';

class ParentalLock extends StatefulWidget {
  const ParentalLock({super.key});

  @override
  State<ParentalLock> createState() => _ParentalLockState();
}

class _ParentalLockState extends State<ParentalLock> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Parental Lock'),
    );
  }
}

class _LockScreen extends StatefulWidget {
  const _LockScreen({super.key});

  @override
  State<_LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<_LockScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
