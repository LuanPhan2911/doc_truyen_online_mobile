import 'package:dio/dio.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio dio() {
  var dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['APP_BACKEND_URL'] as String,
      headers: {"Accept": "Application/Json"},
    ),
  );

  return dio;
}
