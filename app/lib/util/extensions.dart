import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  dismissKeyboard(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: this,
    );
  }

  ignoreTouch(bool active) {
    return WillPopScope(
      onWillPop: () async => !active,
      child: AbsorbPointer(
        absorbing: active,
        child: this,
      ),
    );
  }

  freezePage(bool active) {
    return Stack(
      children: [
        this,
        if (active) Container(height: double.infinity, width: double.infinity).ignoreTouch(active),
      ],
    );
  }
}
