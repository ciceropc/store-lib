import 'package:get/get.dart';
import 'package:logging/logging.dart';

import 'package:app/module/onboarding/bindings/onboarding_binding.dart';
import 'package:app/module/onboarding/pages/onboarding_page.dart';
import 'package:app/module/profile/bindings/profile_binding.dart';
import 'package:app/module/profile/notifications/bindings/notifications_binding.dart';
import 'package:app/module/profile/notifications/pages/notifications_page.dart';
import 'package:app/module/profile/pages/choose_sign_page.dart';
import 'package:app/module/profile/password/bindings/reset_password_bindings.dart';
import 'package:app/module/profile/password/pages/reset_password_page.dart';
import 'package:app/module/root/bindings/root_binding.dart';
import 'package:app/module/root/pages/root_page.dart';
import 'package:app/module/sign/pages/sign_in_error_page.dart';
import 'package:app/module/sign/pages/sign_in_page.dart';
import 'package:app/module/sign/pages/sign_up_page.dart';
import 'package:app/module/sign/pages/sign_up_page_access_key_page.dart';
import 'package:app/module/sign/pages/sign_up_password_page.dart';
import 'package:app/module/sign/pages/sign_up_result_page.dart';
import 'package:app/module/sign_forgot_password/pages/forgot_password_access_key_page.dart';
import 'package:app/module/sign_forgot_password/pages/forgot_password_email_page.dart';
import 'package:app/module/sign_forgot_password/pages/forgot_password_result_page.dart';
import 'package:app/module/sign_forgot_password/pages/forgot_password_set_page.dart';
import 'package:app/util/logging.dart';

abstract class Routes {
  static const ROOT = '/';
  static const ON_BOARDING = '/on_boarding';
  static const HOME = '/home';
  static const SEARCH = '/search';
  static const SEARCH_RESULT = '/search_result';
  static const CART = '/cart';
  static const CART_SHIPPING = '/cart_shipping';
  static const CART_PAYMENT = '/cart_payment';
  static const CART_IDENTIFY_USER = '/cart_identify_user';
  static const CHOOSE_SIGN = '/choose_sign';
  static const SIGN_IN = '/sign_in';
  static const SIGN_IN_ERROR = '/sign_in_error';
  static const SIGN_UP = '/sign_up';
  static const SIGN_UP_PASSWORD = '/sign_up_password';
  static const SIGN_UP_ACCESS_KEY = '/sign_up_access_key';
  static const SIGN_UP_RESULT = '/sign_up_result';
  static const PRIVACY_POLICY = '/privacy_policy';
  static const FORGOT_PASSWORD_EMAIL = '/forgot_password_email';
  static const RESET_PASSWORD = '/reset_password';
  static const USER_ADDRESS = '/user_address';
  static const NOTIFICATION_HISTORY = '/notification_history';
  static const FORGOT_PASSWORD_SET = '/forgot_password_set';
  static const FORGOT_PASSWORD_ACCESS_KEY = '/forgot_password_access_key';
  static const FORGOT_PASSWORD_RESULT = '/forgot_password_result';
  static const WARRANTY_POLICY = '/warranty_policy';
  static const TECHNICAL_ASSISTANCE = '/technical_assistance';
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.ROOT,
      page: () => RootPage(),
      binding: RootBinding(),
    ),
    GetPage(
      name: Routes.ON_BOARDING,
      page: () => OnBoardingPage(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: Routes.CHOOSE_SIGN,
      page: () => ChooseSignPage(),
      binding: ProfileBinding(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.NOTIFICATION_HISTORY,
      page: () => NotificationsPage(),
      binding: NotificationsBinding(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () => SignInPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.SIGN_IN_ERROR,
      page: () => SignInErrorPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.SIGN_UP_PASSWORD,
      page: () => SignUpPasswordPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.SIGN_UP_ACCESS_KEY,
      page: () => SignUpPageAccessKeyPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.SIGN_UP_RESULT,
      page: () => SignUpResultPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD_EMAIL,
      page: () => ForgotPasswordEmailPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => ResetPasswordPage(),
      binding: ResetPasswordBinding(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD_SET,
      page: () => ForgotPasswordSetPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD_ACCESS_KEY,
      page: () => ForgotPasswordAccessKeyPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD_RESULT,
      page: () => ForgotPasswordResultPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 250),
    ),
  ];
}

class AppRoutes {
  static void redirectFromBanner(_destination) {
    _redirect(_destination, Routes.HOME);
    Logging().logger.log(Level.INFO, 'AppRoutes - Redirected from Banner');
  }

  static void redirectFromCarousel(_destination) {
    _redirect(_destination, Routes.HOME);
    Logging().logger.log(Level.INFO, 'AppRoutes - Redirected from Carousel');
  }

  static void redirectFromList(_destination) {
    _redirect(_destination, Routes.HOME);
    Logging().logger.log(Level.INFO, 'AppRoutes - Redirected from List');
  }

  static void redirectFromNotification(_destination) {
    _redirect(_destination, Routes.NOTIFICATION_HISTORY);
    Logging().logger.log(Level.INFO, 'AppRoutes - Redirected from Notification');
  }

  static void _redirect(_destination, defaultRoute) async {
    final String _destinationPage = _destination['destination'].toString().toLowerCase();
    final String _destinationId = _destination['destinationId'].toString().toLowerCase();

    if (_destinationPage != null && _destinationId != null) {
      Logging().logger.log(Level.INFO, 'Redirected to $_destinationPage/$_destinationId.');
    } else {
      Logging().logger.log(Level.ALL, 'Destination can\'t be null');
      Get.toNamed(defaultRoute);
    }
  }
}
