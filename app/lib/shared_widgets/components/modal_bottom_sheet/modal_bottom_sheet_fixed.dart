import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/theme/app_theme.dart';
import 'package:app/theme/icons/app_icons.dart';

class ModalBottomSheetFixed extends StatelessWidget {
  final String title;
  final String secondTitle;
  final Function onTapSecondTitle;
  final bool centerTitle;
  final Widget child;
  final Color colorBackground;
  final double horizontalContentPadding;
  final double horizontalTitlePadding;
  final double bottomContentPadding;
  final bool showBackbutton;

  ModalBottomSheetFixed({
    this.title,
    this.centerTitle = true,
    this.child,
    this.colorBackground,
    this.horizontalContentPadding,
    this.horizontalTitlePadding,
    this.bottomContentPadding,
    this.secondTitle,
    this.onTapSecondTitle,
    this.showBackbutton = false,
  });

  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.of(context).padding.bottom;

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: colorBackground ?? backgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.0),
            topLeft: Radius.circular(8.0),
          ),
        ),
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 4,
                width: 70,
                decoration: BoxDecoration(
                  color: textLow,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                  horizontalContentPadding ?? 24,
                  showBackbutton ? 0 : 25,
                  horizontalContentPadding ?? 24,
                  bottomContentPadding ?? 24 + paddingBottom,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: double.infinity),
                    showBackbutton
                        ? Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: CircleBorder(),
                              onTap: () {
                                Get.back();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16, right: 16),
                                child: Icon(
                                  AppIcons.arrow_back_nv,
                                  color: accentColor,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    title != null
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: horizontalTitlePadding ?? 0),
                            child: Column(children: [
                              secondTitle != null
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          title,
                                          style: bodyBold.copyWith(
                                            color: textHigh,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: onTapSecondTitle,
                                          child: Container(
                                            child: Text(
                                              secondTitle,
                                              style: button.copyWith(
                                                color: accentColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      title,
                                      style: bodyBold.copyWith(color: textHigh),
                                    ),
                              SizedBox(height: 10),
                            ]),
                          )
                        : Container(),
                    if (child != null) child else Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
