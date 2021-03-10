import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_analytics/observer.dart';

import 'package:app/app_config.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/util/credentials.dart';
import 'package:app/util/extensions.dart';
import 'package:app/util/logging.dart';
import 'package:app/util/messages.dart';

var initialRoute = Routes.ROOT;

Future<bool> _isFirstTime() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool firstTime = (prefs.getBool('first_time') ?? true);
  return firstTime;
}

Future<void> _getInitialRoute() async {
  if (await _isFirstTime()) {
    initialRoute = Routes.ON_BOARDING;
  }
}

Future<void> mainCommon(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  // await _getInitialRoute();

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/montserrat/OFL.txt');
    yield LicenseEntryWithLineBreaks(['montserrat'], license);
  });

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Logging().logger.onRecord.listen(
    (logRecord) {
      Logging().handleLog(logRecord);
    },
  );

  // Environment environment = Environment();

  // Contentful Instance
  // ContentfulAPI contentfulAPI = environment.contentfulApiInstance(appConfig.flavor);
  // Get.put(contentfulAPI, tag: 'contentfulapi');
  // TODO: CONFIGURE CMS

  // Init Firebase
  // await Firebase.initializeApp();

  // Firebase Instance
  // FirebaseAnalytics analytics = FirebaseAnalytics();
  // Get.put(analytics, tag: 'analytics');

  // Notification Service
  // Get.put(NotificationService());
  // TODO: CONFIGURE NOTIFICATION SERVICE

  runZoned<Future<Null>>(() async {
    _preloadImages();

    runApp(MyApp());
  }, onError: (error, stackTrace) async {
    Logging().logger.warning(error);
  });
}

void _preloadImages() {
  precachePicture(
    ExactAssetPicture((SvgPicture.svgStringDecoder), 'assets/icons/apple.svg'),
    null,
  );
  precachePicture(
    ExactAssetPicture((SvgPicture.svgStringDecoder), 'assets/icons/facebook.svg'),
    null,
  );
  precachePicture(
    ExactAssetPicture((SvgPicture.svgStringDecoder), 'assets/icons/google.svg'),
    null,
  );
  precachePicture(
    ExactAssetPicture((SvgPicture.svgStringDecoder), 'assets/icons/more_horiz_nv.svg'),
    null,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: appThemeData,
      initialRoute: initialRoute,
      getPages: AppPages.pages,
      defaultTransition: Transition.noTransition,
      translations: Messages(),
      locale: ui.window.locale,
      fallbackLocale: Locale('pt', 'BR'),
      localizationsDelegates: [
        DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt'),
        const Locale('en'),
      ],
      // navigatorObservers: [
      //   FirebaseAnalyticsObserver(
      //     analytics: Get.find<FirebaseAnalytics>(tag: 'analytics'),
      //   ),
      // ],
    ).dismissKeyboard(context);
  }
}
