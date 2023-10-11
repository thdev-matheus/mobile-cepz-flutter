import 'package:cepz/api/cepz_api.dart';
import 'package:cepz/models/models.dart';

// import 'package:dio/dio.dart';

class CepRepository {
  final _cepzAPI = CepzAPI().dio;

  CepRepository() {
    _cepzAPI.options.headers['X-Parse-Session-Token'] = UserModel.sessionToken;
  }

  Future<void> getCeps() async {
    var response = await _cepzAPI.get('/classes/Address');

    UserCepsModel.fromJson(response.data);
  }
}
