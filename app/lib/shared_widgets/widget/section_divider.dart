import 'package:flutter/material.dart';

import 'package:app/theme/app_theme.dart';

class SectionDivider extends StatelessWidget {
  final String title;
  final String titleCallToAction;
  final Function onTapCallToAction;
  final bool showCallToAction;

  const SectionDivider({
    this.title,
    this.titleCallToAction = 'Ver mais',
    this.onTapCallToAction,
    this.showCallToAction = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 30, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: headlineBold.copyWith(color: textHigh),
            ),
          ),
          Offstage(
            offstage: showCallToAction == false,
            child: GestureDetector(
              onTap: onTapCallToAction,
              child: Text(
                titleCallToAction,
                style: button.copyWith(color: accentColor, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
