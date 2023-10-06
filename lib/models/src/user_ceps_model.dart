import 'package:cepz/models/models.dart';

class UserCepsModel {
  List<Cep> ceps = [];

  UserCepsModel(this.ceps);

  UserCepsModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      ceps = <Cep>[];
      json['results'].forEach((v) {
        ceps.add(Cep.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['results'] = ceps.map((v) => v.toJson()).toList();

    return data;
  }
}
