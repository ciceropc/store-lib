import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EyeAnimation extends StatefulWidget {
  final bool enableEye;

  const EyeAnimation({Key key, this.enableEye}) : super(key: key);
  @override
  _EyeAnimationState createState() => _EyeAnimationState();
}

class _EyeAnimationState extends State<EyeAnimation>
    with TickerProviderStateMixin {
  AnimationController _animController;
  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enableEye) {
      _animController.forward();
    } else {
      _animController.reverse();
    }
    return Lottie.asset('assets/anim/open_eye.json',
        animate: true, repeat: false, controller: _animController);
  }
}
