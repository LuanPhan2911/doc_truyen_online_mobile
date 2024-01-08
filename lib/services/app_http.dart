import 'package:dio/dio.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Dio dio() {
  var dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['APP_BACKEND_URL'] as String,
    ),
  );
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        const storage = FlutterSecureStorage();

        String? token = await storage.read(key: 'token');
        options.headers = {
          "Accept": "Application/Json",
          "Authorization": "Bearer $token",
        };
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        return handler.next(response);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) {
        return handler.next(error);
      },
    ),
  );
  return dio;
}
