import 'package:cepz/api/cepz_api.dart';
import 'package:cepz/models/models.dart';

import 'package:dio/dio.dart';

class UserRepository {
  final _cepzAPI = CepzAPI().dio;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      _cepzAPI.options.headers['X-Parse-Revocable-Session'] = '1';
      var response =
          await _cepzAPI.get('/login?username=$username&password=$password');

      UserModel.fromJson(response.data);

      print(UserModel.toJson());
    } catch (e) {
      print('erro => $e');
    }
  }

  Future<void> register({
    required String username,
    required String password,
  }) async {
    try {
      _cepzAPI.options.headers['X-Parse-Revocable-Session'] = '1';

      var response = await _cepzAPI
          .post('/users', data: {'username': username, 'password': password});

      print(response.data);
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        stackTrace: e.stackTrace,
        error: e.error,
        message: e.message,
        type: e.type,
      );
    } catch (_) {
      throw Exception();
    }
  }

  Future<void> logout() async {
    try {
      _cepzAPI.options.headers['X-Parse-Session-Token'] =
          UserModel.sessionToken;

      const body = {};

      await _cepzAPI.post('/logout', data: body).then((_) {
        UserModel.clearUser();
      });
    } catch (e) {
      print('erro => $e');
    }
  }
}
