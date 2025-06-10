import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);

extension LoggerX on dynamic {
  void e({final DateTime? time, final Object? error, final StackTrace? stackTrace}) => logger.e(this, time: time, error: error, stackTrace: stackTrace);

  void w({final DateTime? time, final Object? error, final StackTrace? stackTrace}) => logger.w(this, time: time, error: error, stackTrace: stackTrace);

  void i({final DateTime? time, final Object? error, final StackTrace? stackTrace}) => logger.i(this, time: time, error: error, stackTrace: stackTrace);

  void d({final DateTime? time, final Object? error, final StackTrace? stackTrace}) => logger.d(this, time: time, error: error, stackTrace: stackTrace);

  void t({final DateTime? time, final Object? error, final StackTrace? stackTrace}) => logger.t(this, time: time, error: error, stackTrace: stackTrace);

  void f({final DateTime? time, final Object? error, final StackTrace? stackTrace}) => logger.f(this, time: time, error: error, stackTrace: stackTrace);
}
