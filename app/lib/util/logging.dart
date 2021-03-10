import 'dart:async';

import 'package:logging/logging.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

// The main thread has a 'real' logger, since it needs access to the log records
// for display; other isolates have loggers that just delegate to the real
// logger.

class Logging {
  static Logging _instance;
  final _logRecords = BehaviorSubject<List<LogRecord>>.seeded(
    [LogRecord(Level.ALL, '', '')],
  );
  final Logger _logger = Logger('App');
  Logger get logger => _logger;
  Stream<List<LogRecord>> get logRecordsStream => _logRecords.stream;

  Level _consoleLevel = Level.FINE;
  final _maxRecordsStoredOnApp = 5000;

  factory Logging() {
    _instance ??= Logging._internalConstructor();
    return _instance;
  }
  Logging._internalConstructor();

  void handleLog(LogRecord log) {
    List<LogRecord> newRecords = _logRecords.value;
    newRecords.add(log);
    if (log.level >= _consoleLevel) print(formatLogRecord(log));
    if (newRecords.length > _maxRecordsStoredOnApp) {
      newRecords.removeAt(0);
    }
    _logRecords.add(newRecords);
  }

  String formatLogRecord(LogRecord record, {bool withDate = false}) =>
      '${withDate ? '${DateFormat.yMd().format(record.time)} ' : ''}${DateFormat('HH:mm:ss.SS').format(record.time)} | ${record.level} - ${record.message}';
}
