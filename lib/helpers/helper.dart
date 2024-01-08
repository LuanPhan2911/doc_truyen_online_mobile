import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class Helper {
  static var logger = Logger();

  static void logWarning(log, {String message = ""}) =>
      logger.w(message, error: log);
  static String asset(image) {
    return "${dotenv.env['APP_BACKEND_URL'] as String}storage/$image";
  }
}
