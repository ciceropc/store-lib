import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/components/secondary_button.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/theme/icons/app_icons.dart';

class FeedbackScreen extends StatelessWidget {
  final List<Widget> actions;
  final List<Widget> feedback;

  const FeedbackScreen({this.actions, this.feedback});

  factory FeedbackScreen.registerSuccess(
      {String title: 'Conta criada com sucesso', String contentText: '', List<Widget> actions}) {
    return FeedbackScreen(
      actions: actions ??
          [
            PrimaryButton(
              text: 'Entrar',
              onTap: () {
                Get.close(0);
              },
            ),
          ],
      feedback: [
        Lottie.asset(
          'assets/anim/success.json',
          repeat: false,
          width: 76.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 3.0),
          child: Text(
            title,
            style: headlineBold,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 34.0),
          child: Text(
            contentText,
            style: bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  factory FeedbackScreen.registerError({String title: 'Ops! Tivemos um problema.', List<Widget> actions}) {
    return FeedbackScreen(
      actions: actions ??
          [
            PrimaryButton(
              icon: AppIcons.refresh_nv,
              text: 'Recarregar',
              onTap: () {},
            ),
            SecondaryButton(
              text: 'Voltar',
              onTap: () {},
            ),
          ],
      feedback: [
        Lottie.asset(
          'assets/anim/error.json',
          repeat: false,
          width: 76.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 55.0),
          child: Text(
            title,
            style: headlineBold,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: feedback
                    .map((e) => Padding(
                          padding: EdgeInsets.only(bottom: 19.0),
                          child: e,
                        ))
                    .toList(),
              ),
            ),
          ),
          Column(
            children: actions
                .map((e) => Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: e,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
