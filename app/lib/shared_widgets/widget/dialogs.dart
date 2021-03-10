import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/components/secondary_button.dart';
import 'package:app/theme/app_theme.dart';

showRequestLoginDialog() {
  Get.dialog(
      AlertDialog(
        content: WillPopScope(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/alert_error_outline.svg'),
              SizedBox(height: 16),
              Text(
                "Confirme sua identidade",
                style: bodyBold.copyWith(color: textHigh),
              ),
              SizedBox(height: 16),
              HtmlWidget(
                '''<center>Para alterar ou adicionar dados de entrega ou pagamento, é necessário que você acesse a sua conta.<center>''',
                textStyle: captionRegular.copyWith(color: textHigh),
              ),
              SizedBox(height: 16),
              PrimaryButton(
                  onTap: () {
                    Get.offNamedUntil(Routes.ROOT, (route) => Get.currentRoute == Routes.ROOT);
                    Get.toNamed(Routes.SIGN_IN, arguments: 'fromCart');
                  },
                  text: 'Entrar na minha conta'),
              SizedBox(height: 16),
              SecondaryButton(
                  textColor: accentColor,
                  onTap: () {
                    Get.back();
                  },
                  text: 'Cancelar')
            ],
          ),
          onWillPop: () => Future.value(false),
        ),
        contentPadding: EdgeInsets.all(24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      barrierDismissible: false);
}
