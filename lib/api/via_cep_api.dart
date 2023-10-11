import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ViaCepAPI {
  final _dio = Dio();

  Dio get dio => _dio;

  ViaCepAPI() {
    _dio.options.baseUrl = dotenv.get('VIA_CEP_BASE_API');
  }
}
