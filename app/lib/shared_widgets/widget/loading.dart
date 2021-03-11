import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimatedIcon extends StatelessWidget {
  final bool isLoading;
  final double size;
  final bool setWhite;

  const LoadingAnimatedIcon({this.isLoading: true, this.size = 70.0, this.setWhite: false});
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isLoading,
        child: Lottie.asset(setWhite ? 'assets/anim/loader_branco_nv.json' : 'assets/anim/loader_azul_nv.json',
            width: size, height: size));
  }
}

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Container(
          color: Colors.transparent,
          height: 50,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoadingAnimatedIcon(setWhite: true),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void dismissLoading(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop('dialog');
}
