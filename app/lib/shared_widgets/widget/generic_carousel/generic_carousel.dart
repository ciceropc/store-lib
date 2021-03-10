import 'package:flutter/material.dart';

import 'package:app/shared_widgets/widget/section_divider.dart';

class GenericCarousel extends StatelessWidget {
  final VoidCallback onTapCallToAction;
  final String title;
  final List<Widget> children;
  final double rightSpaceBetweenElements;
  final double bottomSpaceBetweenElements;
  final double scrollSpaceHorizontal;
  final double paddingBottom;
  final bool showCallToAction;

  const GenericCarousel({
    this.onTapCallToAction,
    this.title,
    this.children,
    this.rightSpaceBetweenElements = 20.0,
    this.bottomSpaceBetweenElements = 0,
    this.scrollSpaceHorizontal = 0,
    this.paddingBottom = 25,
    this.showCallToAction = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionDivider(
            title: title,
            onTapCallToAction: onTapCallToAction,
            showCallToAction: showCallToAction,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: scrollSpaceHorizontal),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: children
                  .map((e) => Padding(
                        padding: EdgeInsets.only(
                          right: rightSpaceBetweenElements,
                          bottom: bottomSpaceBetweenElements,
                        ),
                        child: e,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
