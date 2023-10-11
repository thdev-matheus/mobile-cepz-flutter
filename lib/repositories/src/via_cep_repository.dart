import 'package:cepz/api/via_cep_api.dart';
import 'package:cepz/models/models.dart';

class ViaCepRepository {
  final _viaCepAPI = ViaCepAPI().dio;

  Future<ViaCepModel?> searchCep(String cepTxt) async {
    try {
      var response = await _viaCepAPI.get('/$cepTxt/json/');

      if (response.data['erro'] == true) {
        throw Error();
      }

      return ViaCepModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
