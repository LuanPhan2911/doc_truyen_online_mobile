import 'package:logger/logger.dart';

class Helper {
  static var logger = Logger();

  static void logWarning(log, {String message = ""}) =>
      logger.w(message, error: log);
}
