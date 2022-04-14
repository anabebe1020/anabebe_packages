import 'package:intl/intl.dart';

/// logger singleton class
class Logger {
  static final Logger _singleton = Logger._internal();

  factory Logger() {
    return _singleton;
  }

  Logger._internal();

  late final String _logName;

  setup(String logName) {
    _logName = logName;
  }

  void log(String message) async {
    final now = DateTime.now().toLocal();
    final nowTime = DateFormat('yyyy/MM/dd HH:mm:ss').format(now);
    print('[$nowTime] [$_logName] $message');
  }
}