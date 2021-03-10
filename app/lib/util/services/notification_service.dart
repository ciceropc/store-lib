import 'dart:async';
import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:app/routes/app_routes.dart';
import 'package:app/shared_widgets/widget/snack_bar.dart';
import 'package:app/util/logging.dart';
import 'package:app/util/services/local_storage_service.dart';

class NotificationService extends GetxService {
  final AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel',
    'Notificações App',
    'Canal de notificações locais App.',
    importance: Importance.max,
  );

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  StreamSubscription _subscription;

  final token = ''.obs;
  final isNotificationPermissionEnabled = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await _flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: IOSInitializationSettings(
            requestAlertPermission: false, requestBadgePermission: false, requestSoundPermission: false),
      ),
      onSelectNotification: (_onSelectLocalNotification),
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    // _firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     Logging().logger.log(Level.INFO, 'Firebase Messaging - onMessage: $message');

    //     Map pushNotification = await _parseNotificationMap(message);

    //     showNotificationSnackBar(
    //       pushNotification['id'],
    //       pushNotification['title'],
    //       pushNotification['body'],
    //       pushNotification['destination'],
    //     );
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     Logging().logger.log(Level.INFO, 'Firebase Messaging - onLaunch: $message');
    //     _redirectFromNotification(message);
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     Logging().logger.log(Level.INFO, 'Firebase Messaging - onResume: $message');
    //     _redirectFromNotification(message);
    //   },
    // );

    // await _firebaseMessaging.requestNotificationPermissions();

    // token.value = await _firebaseMessaging.getToken();

    Logging().logger.log(Level.INFO, 'Firebase Messaging - token: $token');

    resquestNotificationPermission();

    super.onInit();
  }

  void _redirectFromNotification(message) async {
    if (message != null) {
      Map pushNotification = await _parseNotificationMap(message);

      if (pushNotification.containsKey('destination'))
        AppRoutes.redirectFromNotification(pushNotification['destination']);
    }
  }

  Future<void> resquestNotificationPermission() async {
    var statusNotification = await Permission.notification.status;

    if (statusNotification == PermissionStatus.denied) {
      openAppSettings();
    } else {
      statusNotification = await Permission.notification.request();
    }

    checkPermission();
  }

  Future<bool> checkPermission() async {
    var statusNotification = await Permission.notification.status;

    return isNotificationPermissionEnabled.value = statusNotification == PermissionStatus.granted;
  }

  // Future<String> getToken() => _firebaseMessaging.getToken();

  Future _onSelectLocalNotification(String payload) async {
    Logging().logger.info(payload);
  }

  void registerTokenRefreshListener(void Function(String) listener) {
    Logging().logger.log(Level.INFO, 'Registering Token Listener: $listener');

    removeTokenRefreshListener();
    // _subscription = _firebaseMessaging.onTokenRefresh.listen(listener);
  }

  void removeTokenRefreshListener() {
    if (_subscription != null) _subscription.cancel();
  }

  Future _parseNotificationMap(Map<String, dynamic> message) async {
    var notification;

    if (Platform.isIOS && !message.containsKey('notification')) {
      notification = message['aps']['alert'];
    } else {
      notification = message['notification'];
    }

    final title = notification['title'];
    final body = notification['body'];

    var destination;

    if (message.containsKey('destination') && message.containsKey('destinationId')) {
      destination = {
        'destination': message['destination'],
        'destinationId': message['destinationId'],
      };
    }

    final _notification = {
      'id': message.hashCode,
      'title': title,
      'body': body,
      'destination': destination,
      'received': DateTime.now(),
    };

    final _localStorageService = Get.find<LocalStorageService>();

    _localStorageService.saveNotification(_notification);

    return _notification;
  }

  @override
  void onClose() {
    Logging().logger.log(Level.INFO, 'Notification Service - Closing');
    removeTokenRefreshListener();
    super.onClose();
  }
}
