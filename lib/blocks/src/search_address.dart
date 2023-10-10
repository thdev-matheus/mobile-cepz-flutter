import 'package:cepz/components/components.dart';
import 'package:cepz/models/models.dart';
import 'package:cepz/styles/global_styles.dart';
import 'package:flutter/material.dart';
import 'package:cepz/blocks/blocks.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({super.key});

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  CepModel? cep;

  String? resultText = 'Busque um CEP';

  Future<void> handleSearchCep(String value) async {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SearchAddressForm(onAction: handleSearchCep),
        separator(height: 48),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Resultado',
              style: primaryTextStyle(size: 22, weight: FontWeight.bold),
            ),
            separator(height: 22),
            cep != null && resultText == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CEP: ${cep!.cep}',
                        style: primaryTextStyle(
                          size: 18,
                          weight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cep!.logradouro,
                        style: primaryTextStyle(
                          size: 16,
                        ),
                      ),
                      Text(
                        'Complemento: ${cep!.complemento != '' ? cep!.complemento : 'N/A'}',
                        style: primaryTextStyle(size: 14),
                      ),
                      Text(
                        'Local: ${cep!.bairro} - ${cep!.localidade}/${cep!.uf}',
                        style: primaryTextStyle(size: 16),
                      ),
                    ],
                  )
                : Text(
                    resultText!,
                    style: primaryTextStyle(
                      size: 18,
                    ),
                  )
          ],
        ),
      ],
    );
  }
}
