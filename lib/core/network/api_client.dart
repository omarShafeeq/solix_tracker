import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../config/app_config.dart';
import '../constants/app_constants.dart';
import '../error/exceptions.dart';

class ApiClient {
  ApiClient({Dio? dio}) : _dio = dio ?? createDio();

  final Dio _dio;

  Future<Map<String, dynamic>> post(
    String path, {
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _dio.post<dynamic>(path, data: body);
      return _decodeBody(response.data);
    } on AppException {
      rethrow;
    } on DioException catch (error) {
      throw mapDioException(error);
    } on FormatException {
      throw const InvalidResponseException('أعاد الخادم بيانات غير صالحة.');
    }
  }
}

Dio createDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.normalizedBaseUrl,
      connectTimeout: AppConstants.requestTimeout,
      receiveTimeout: AppConstants.requestTimeout,
      sendTimeout: AppConstants.requestTimeout,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: <String, dynamic>{Headers.acceptHeader: Headers.jsonContentType},
    ),
  );

  if (kDebugMode) {
    dio.interceptors.add(_SafeLogInterceptor());
  }
  return dio;
}

Map<String, dynamic> _decodeBody(Object? data) {
  if (data is Map<String, dynamic>) {
    return data;
  }
  if (data is Map) {
    return Map<String, dynamic>.from(data);
  }
  if (data is String && data.trim().isNotEmpty) {
    final decoded = jsonDecode(data);
    if (decoded is Map) {
      return Map<String, dynamic>.from(decoded);
    }
  }
  throw const InvalidResponseException('أعاد الخادم استجابة غير متوقعة.');
}

AppException mapDioException(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
      return const TimeoutRequestException(
        'انتهت مهلة الطلب. تحقق من الاتصال ثم أعد المحاولة.',
      );
    case DioExceptionType.connectionError:
      return const NetworkException(
        'لا يوجد اتصال بالإنترنت. ما زالت آخر البيانات المحمّلة معروضة.',
      );
    case DioExceptionType.cancel:
      return const NetworkException('تم إلغاء الطلب.');
    case DioExceptionType.badCertificate:
      return const NetworkException(
        'تعذر التحقق من الاتصال الآمن بخدمة التتبع.',
      );
    case DioExceptionType.badResponse:
      return _fromStatusCode(error.response?.statusCode);
    case DioExceptionType.unknown:
      final message = error.message?.toLowerCase() ?? '';
      if (message.contains('socket') ||
          message.contains('network') ||
          message.contains('failed host')) {
        return const NetworkException(
          'لا يوجد اتصال بالإنترنت. ما زالت آخر البيانات المحمّلة معروضة.',
        );
      }
      return const ServerException('تعذر الوصول إلى خدمة التتبع.');
  }
}

AppException _fromStatusCode(int? statusCode) {
  if (statusCode == 401 || statusCode == 403) {
    return const UnauthorizedException(
      'رفضت الواجهة بيانات الدخول. تحقق من رمز الوصول.',
    );
  }
  if (statusCode == 404) {
    return const InvalidResponseException(
      'لم يتم العثور على مسار خدمة التتبع.',
    );
  }
  if (statusCode != null && statusCode >= 500) {
    return ServerException('خدمة التتبع غير متاحة (HTTP $statusCode).');
  }
  if (statusCode != null) {
    return ServerException('أعادت خدمة التتبع الرمز HTTP $statusCode.');
  }
  return const ServerException('أعادت خدمة التتبع خطأ.');
}

/// Logs the path and status only. Request bodies contain the API hash and
/// must never be written to the console.
class _SafeLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('[API] ${options.method} ${options.uri.path}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint(
      '[API] ${response.statusCode} ${response.requestOptions.uri.path}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
      '[API] error ${err.response?.statusCode ?? err.type.name} '
      '${err.requestOptions.uri.path}',
    );
    handler.next(err);
  }
}
