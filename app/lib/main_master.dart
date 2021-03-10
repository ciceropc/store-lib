import 'package:flutter/material.dart';

import 'package:app/app_config.dart';
import 'package:app/main.dart';

Future<void> main() async {
  await mainCommon(
    AppConfig(
      flavor: Flavor.PRODUCTION,
      firebaseFunctionsBaseUrl: '',
      bannerConfig: BannerConfig(
        bannerName: 'MASTER',
        bannerColor: Colors.deepOrangeAccent,
      ),
    ),
  );
}
