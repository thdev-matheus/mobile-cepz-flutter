import 'package:cepz/blocks/blocks.dart';
import 'package:cepz/repositories/repositories.dart';
import 'package:cepz/styles/global_styles.dart';
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

  void removeAddress({required String id}) {
    showDialog(
      context: context,
      builder: (BuildContext bc) {
        return RemoveAddressModal(
          actionRemove: () async {
            await cepRepository.deleteCep(id).then((_) {
              setState(() {});
              Navigator.pop(context);
            });
          },
        );
      },
    );
  }

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
    return UserCepsModel.ceps.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Não há endereços salvos!',
                  style: primaryTextStyle(
                    size: 22,
                    weight: FontWeight.bold,
                  ),
                ),
                separator(height: 16),
                Text(
                  'Salve novos endereços para que eles apareçam aqui',
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(size: 16),
                )
              ],
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: UserCepsModel.ceps.length,
            itemBuilder: (_, index) => AddressCard(
              cep: UserCepsModel.ceps[index],
              removeAddress: removeAddress,
            ),
          );
  }
}
