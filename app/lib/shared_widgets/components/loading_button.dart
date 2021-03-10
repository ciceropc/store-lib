import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class LoadingButton extends StatelessWidget {
  final bool isLoading;
  final Widget loaderWidget;
  final Widget buttonWidget;
  final double paddingTop;
  final double sizeLoaderWidget;
  final double iconPaddingBottom;

  const LoadingButton({
    @required this.isLoading,
    this.loaderWidget,
    @required this.buttonWidget,
    this.paddingTop = 20,
    this.sizeLoaderWidget = 70,
    this.iconPaddingBottom,
  });

  @override
  Widget build(BuildContext context) {
    var _loaderWidget = loaderWidget ??
        Lottie.asset(
          'assets/anim/loader_azul_nv.json',
          width: sizeLoaderWidget,
          height: sizeLoaderWidget,
        );

    return Center(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: isLoading
            ? _loaderWidget
            : Padding(
                padding: EdgeInsets.only(top: paddingTop),
                child: buttonWidget,
              ),
      ),
    );
  }
}
