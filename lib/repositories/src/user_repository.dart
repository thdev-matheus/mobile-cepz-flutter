import 'package:cepz/api/cepz_api.dart';
import 'package:cepz/models/models.dart';

class UserRepository {
  final _api = CepzAPI().dio;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      _api.options.headers['X-Parse-Revocable-Session'] = '1';
      var response =
          await _api.get('/login?username=$username&password=$password');

      UserModel.fromJson(response.data);

      print(UserModel.toJson());
    } catch (e) {
      print('erro => $e');
    }
  }
}
