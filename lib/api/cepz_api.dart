import 'package:cepz/api/cepz_api_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CepzAPI {
  final _dio = Dio();

  Dio get dio => _dio;

  CepzAPI() {
    _dio.options.baseUrl = dotenv.get('BASE_URL');
    _dio.options.headers['Content-Type'] = 'application/json';

    _dio.interceptors.add(CepzAPIInterceptor());
  }
}
