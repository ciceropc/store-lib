import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService {
  static var _firebaseAnalytics = FirebaseAnalytics();

  static Future<void> setUserId(String user) async {
    await _firebaseAnalytics.setUserId(user);
  }

  static Future<void> logClick(String page, String name) async {
    await _firebaseAnalytics.logEvent(
        name: 'clique_$name',
        parameters: <String, dynamic>{'screen': page, 'type': 'click', 'event': name});
  }

  static Future<void> logError(String page, String name) async {
    await _firebaseAnalytics.logEvent(
        name: 'erro_$name',
        parameters: <String, dynamic>{'screen': page, 'type': 'error', 'event': name});
  }

  static Future<void> logClickDepartment(String name, String department) async {
    await _firebaseAnalytics.logEvent(name: 'clique_$name', parameters: <String, dynamic>{
      'screen': 'departamento',
      'type': 'click',
      'event': name,
      'department': department
    });
  }

  static Future<void> logClickVariation(String page, String name, String variation) async {
    await _firebaseAnalytics.logEvent(name: 'clique_$name', parameters: <String, dynamic>{
      'screen': page,
      'type': 'click',
      'event': name,
      'variation': variation
    });
  }
}
