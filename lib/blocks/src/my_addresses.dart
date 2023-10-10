import 'package:flutter/material.dart';
import 'package:cepz/components/components.dart';
import 'package:cepz/models/models.dart';

class MyAddresses extends StatefulWidget {
  const MyAddresses({
    super.key,
  });

  @override
  State<MyAddresses> createState() => _MyAddressesState();
}

class _MyAddressesState extends State<MyAddresses> {
  List<CepModel> cepList = [
    CepModel(
      '0',
      '55020825',
      'Rua Radialisata Mcdowell Holanda',
      '',
      'São José',
      'Caruaru',
      'PE',
      '81',
    ),
    CepModel(
      '1',
      '53370390',
      'Rua Paca',
      'Quadra D26',
      'Ouro Preto',
      'Olinda',
      'PE',
      '81',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: cepList.length,
      itemBuilder: (_, index) => AddressCard(
        cep: cepList[index],
      ),
    );
  }
}
