import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:lottie/lottie.dart';

import 'package:app/module/onboarding/controller/onboarding_controller.dart';
import 'package:app/module/onboarding/widget/intro_slider_kobe.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/shared_widgets/widget/loading.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/theme/icons/app_icons.dart';
import 'package:app/theme/widgets_styles.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> with WidgetsBindingObserver {
  List<Slide> slides = new List();
  final OnBoardingController controller = Get.find();

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      controller.checkPermission();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    //1
    slides.add(
      Slide(
          marginTitle: EdgeInsets.only(right: 16),
          marginDescription: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          widgetTitle: _buildSkipButton(),
          widgetDescription: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Lottie.asset('assets/anim/novidades.json', repeat: false, width: 200, height: 200),
                      Text(
                        'Novidades para você todos os dias!',
                        style: headlineBold.copyWith(color: textHigh),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Receba notificações sobre promoções exclusivas do app e rastreio de pedidos',
                        style: bodyRegular.copyWith(color: textHigh),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                (Platform.isIOS)
                    ? Container(
                        decoration: decorationRoundedWithoutBorder,
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Permitir notificações',
                              style: bodyMedium.copyWith(color: textHigh),
                            ),
                            Obx(() {
                              return Switch(
                                materialTapTargetSize: MaterialTapTargetSize.padded,
                                onChanged: (value) {
                                  controller.toggleNotification();
                                },
                                value: controller.enableNotifications.value,
                                inactiveThumbColor: textLow,
                                inactiveTrackColor: disabledColor,
                              );
                            })
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          backgroundColor: backgroundColor),
    );
    //2
    slides.add(
      Slide(
        marginTitle: EdgeInsets.only(right: 16),
        marginDescription: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        widgetTitle: _buildSkipButton(),
        widgetDescription: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  Lottie.asset('assets/anim/favoritos.json', repeat: false, width: 200, height: 200),
                  Text(
                    'Salve seus produtos favoritos',
                    style: headlineBold.copyWith(color: textHigh),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Você pode criar sua própria lista com os produtos que você mais gostou',
                    style: bodyRegular.copyWith(color: textHigh),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
        backgroundColor: backgroundColor,
      ),
    );
    //3
    slides.add(
      Slide(
        marginTitle: EdgeInsets.only(right: 16),
        widgetTitle: Container(height: 48),
        marginDescription: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        widgetDescription: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  Lottie.asset('assets/anim/retirada.json', repeat: false, width: 200, height: 200),
                  Text(
                    'Retire seus produtos e economize no frete',
                    style: headlineBold.copyWith(color: textHigh),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Confira a disponibilidade dos nossos produtos em mais de 140 lojas da App',
                    style: bodyRegular.copyWith(color: textHigh),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: decorationRoundedWithoutBorder,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Serviços de localização',
                    style: bodyMedium.copyWith(color: textHigh),
                  ),
                  Obx(() => controller.loading.value
                      ? LoadingAnimatedIcon()
                      : Switch(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          onChanged: (value) {
                            controller.toggleLocalization();
                          },
                          value: controller.enableLocalization.value,
                          inactiveThumbColor: textLow,
                          inactiveTrackColor: disabledColor,
                        ))
                ],
              ),
            )
          ],
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }

  Widget _buildSkipButton() {
    return Align(
        alignment: Alignment.topRight,
        child: Container(
            child: TextButton(
                onPressed: () {
                  controller.setFirstTime();
                  Get.offAndToNamed(Routes.ROOT);
                },
                child: Text('Pular', style: button.copyWith(color: accentColor)))));
  }

  void onDonePress() {
    controller.setFirstTime();
    Get.offAndToNamed(Routes.ROOT);
  }

  @override
  Widget build(BuildContext context) {
    return _buildIntro();
  }

  Widget _buildIntro() {
    return IntroSliderKobe(
      shrinkWrap: true,
      colorDot: textHigh.withAlpha(102),
      colorActiveDot: accentColor,
      verticalScrollbarBehavior: scrollbarBehavior.HIDE,
      renderNextBtn: Align(alignment: Alignment.centerRight, child: Icon(AppIcons.arrow_forward, color: accentColor)),
      renderPrevBtn: Align(alignment: Alignment.centerLeft, child: Icon(AppIcons.arrow_back_nv, color: accentColor)),
      isShowSkipBtn: false,
      isShowPrevBtn: true,
      renderDoneBtn: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Finalizar',
            style: button.copyWith(color: accentColor),
          )),
      widthPrevBtn: MediaQuery.of(context).size.width / 3,
      widthDoneBtn: MediaQuery.of(context).size.width / 3,
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}
