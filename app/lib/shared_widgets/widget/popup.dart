import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/theme/app_theme.dart';

/// Para chamar o [Popup]: [Get.dialog(Popup())]
/// Para fechar o [Popup]: [Get.close(0)]
class Popup extends StatelessWidget {
  final List<Widget> actions;
  final List<Widget> content;
  final double contentPadding;
  final double actionsPadding;
  final EdgeInsets padding;
  final Color color;

  Popup({
    List<Widget> actions,
    List<Widget> content,
    this.contentPadding = 16.0,
    this.actionsPadding = 8.0,
    this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
  })  : actions = actions ?? [PrimaryButton(onTap: () => Get.close(0), text: 'OK')],
        content = content ??
            [Text('Popup padrão. \n Preencha devidamente a widget.', style: bodyRegular, textAlign: TextAlign.center)];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: color ?? appThemeData.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...content
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: contentPadding),
                    child: e,
                  ),
                )
                .toList(),
            SizedBox(height: 8.0),
            ...actions.map(
              (e) => Padding(
                padding: EdgeInsets.symmetric(vertical: actionsPadding),
                child: e,
              ),
            )
          ],
        ),
      ),
    );
  }
}
