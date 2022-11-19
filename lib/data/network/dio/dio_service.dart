import 'package:dio/dio.dart';
import 'package:flutter_updated_boilerplate/utils/dio_logger.dart';

class DioService {
  static Dio? _dio;

  DioService._();

  static Dio get client {
    if (_dio == null) {
      _dio = Dio();
      _dio!.interceptors.clear();
      _dio!.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          responseBody: false,
        ),
      );
    }
    return _dio!;
  }
}
