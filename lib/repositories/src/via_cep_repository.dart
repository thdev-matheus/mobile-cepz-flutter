import 'package:cepz/api/via_cep_api.dart';
import 'package:cepz/models/models.dart';

class ViaCepRepository {
  final _viaCepAPI = ViaCepAPI().dio;

  Future<ViaCepModel?> searchCep(String cepTxt) async {
    try {
      var response = await _viaCepAPI.get('/$cepTxt/json/');
      print(response.data);
      if (response.data['erro'] == true) {
        throw new Error();
      }

      ViaCepModel cep = ViaCepModel.fromJson(response.data);

      return cep;
    } catch (e) {
      return null;
    }
  }
}
