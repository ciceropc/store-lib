import 'package:flutter/material.dart';

enum Flavor {
  PRODUCTION,
  DEVELOPMENT,
}

class AppConfig {
  final Flavor flavor;
  final String firebaseFunctionsBaseUrl;
  final BannerConfig bannerConfig;

  AppConfig({
    this.flavor,
    this.firebaseFunctionsBaseUrl,
    this.bannerConfig,
  });
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;

  BannerConfig({
    @required this.bannerName,
    @required this.bannerColor,
  });
}

class FlavorBanner extends StatelessWidget {
  final Widget child;
  final BannerConfig bannerConfig;

  FlavorBanner({
    @required this.child,
    @required this.bannerConfig,
  });

  @override
  Widget build(BuildContext context) {
    if (bannerConfig == null) return child;
    return Stack(
      children: <Widget>[
        child,
        _buildBanner(context),
      ],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: BannerPainter(
          message: bannerConfig.bannerName,
          textDirection: Directionality.of(context),
          layoutDirection: Directionality.of(context),
          location: BannerLocation.topStart,
          color: bannerConfig.bannerColor,
        ),
      ),
    );
  }
}
