import 'package:cepz/repositories/repositories.dart';
import 'package:cepz/repositories/src/cep_repository.dart';
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
  UserRepository userRepository = UserRepository();
  CepRepository cepRepository = CepRepository();

  Future<void> loadData() async {
    await cepRepository.getCeps();

    setState(() {});
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: UserCepsModel.ceps.length,
      itemBuilder: (_, index) => AddressCard(
        cep: UserCepsModel.ceps[index],
      ),
    );
  }
}
