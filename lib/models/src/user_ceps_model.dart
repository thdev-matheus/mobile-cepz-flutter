import 'package:cepz/models/models.dart';

class UserCepsModel {
  static List<CepModel> ceps = [];

  UserCepsModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      ceps = <CepModel>[];
      json['results'].forEach((v) {
        ceps.add(CepModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['results'] = ceps.map((v) => v.toJson()).toList();

    return data;
  }
}
