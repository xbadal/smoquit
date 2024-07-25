import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:smoquit/helper/url_provider.dart';
import 'package:smoquit/service/storage_service.dart';

import 'locator.dart';

class DioInjector {
  DioInjector() {
    init();
  }

  final _dio = Dio(BaseOptions(
    baseUrl: kuBaseUrl,
    connectTimeout: const Duration(minutes: 5),
    receiveTimeout: const Duration(minutes: 10),
    sendTimeout: const Duration(minutes: 20),
  ));

  Dio get dio => _dio;

  void init() {
    _dio.interceptors
      ..add(CustomInterceptor())
      ..add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          request: false,
          responseHeader: false,
        ),
      );
  }
}

class CustomInterceptor extends Interceptor {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  final _storageService = locator<StorageService>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const username = 'InventoryApiUser';
    const password = 'Passw0rdUserApi@32145@';

    String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    String token = _storageService.authToken ?? '';
    logger.d('$username : $password :');
    logger.d('$basicAuth :');
    if (options.extra['multipart'] == true) {
      options.headers = {'Content-Type': 'multipart/form-data', 'Authorization': basicAuth, 'JsonToken': token};
    } else if (options.extra['removeHeader'] == true) {
      options.headers = {'Content-Type': 'application/json', 'Authorization': basicAuth, 'JsonToken': token};
    } else {
      options.headers = {'Content-Type': 'application/json', 'Authorization': basicAuth, 'JsonToken': token};
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e('OnError ${err.message}');
    return handler.next(err);
  }
}
