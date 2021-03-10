import 'package:flutter/material.dart';

class Fade extends StatelessWidget {
  final Widget child;

  const Fade({@required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(duration: Duration(milliseconds: 300), child: child);
  }
}
