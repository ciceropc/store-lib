import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:logging/logging.dart';

import 'package:app/module/profile/notifications/models/push_notification.dart';
import 'package:app/util/logging.dart';

class LocalStorageService extends GetxService {
  final LocalStorage _storage = LocalStorage('local_storage');
  final List<PushNotification> listOfLocalNotifications = List<PushNotification>().obs;

  final String _storageKey = 'notifications';
  Box _hiveBox;

  @override
  void onInit() async {
    Logging().logger.log(Level.INFO, 'Local Storage Service - Starting');
    super.onInit();

    await Hive.initFlutter();

    _hiveBox = await Hive.openBox(_storageKey);
  }

  @override
  void onClose() {
    Logging().logger.log(Level.INFO, 'Local Storage Service - Closing');
    super.onClose();
    listOfLocalNotifications.clear();
  }

  void saveNotification(_notification) {
    Logging().logger.log(Level.INFO, 'Local Storage Service - Saving Notification');

    listOfLocalNotifications.add(PushNotification.fromJson(_notification));
    _saveStorage();
  }

  void _saveStorage() async {
    Logging().logger.log(Level.INFO, 'Local Storage Service - Saving Notification');

    _storage.setItem(_storageKey, listOfLocalNotifications.map((e) => e.toJson()).toList());
    _hiveBox.put(_storageKey, _storage.getItem(_storageKey));
    print(_hiveBox.get(_storageKey));
  }

  void clearOldMessage() async {
    Logging().logger.log(Level.INFO, 'Local Storage Service - Cleaning Old Notification');

    final now = DateTime.now();

    List<PushNotification> _newList = List<PushNotification>();

    listOfLocalNotifications.map((e) {
      if (now.difference(e.received).inDays < 8) {
        _newList.add(e);
      }
    }).toList();

    listOfLocalNotifications.clear();
    listOfLocalNotifications.addAll(_newList);

    _saveStorage();
  }

  void loadStorage() {
    Logging().logger.log(Level.INFO, 'Local Storage Service - Loading Notification');

    _storage.setItem(_storageKey, _hiveBox.get(_storageKey));
    List<dynamic> _listOfNotification = _storage.getItem(_storageKey);

    if (_listOfNotification != null && _listOfNotification.length > 0) {
      listOfLocalNotifications.clear();

      listOfLocalNotifications.addAll(
        List<PushNotification>.from(
          _listOfNotification.map(
            (e) => PushNotification.fromJson(
              e.cast<String, dynamic>(),
            ),
          ),
        ),
      );
    }
  }
}
