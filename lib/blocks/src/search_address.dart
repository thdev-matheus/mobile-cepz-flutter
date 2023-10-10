import 'package:cepz/components/components.dart';
import 'package:cepz/models/models.dart';
import 'package:cepz/repositories/src/via_cep_repository.dart';
import 'package:cepz/styles/global_styles.dart';
import 'package:flutter/material.dart';
import 'package:cepz/blocks/blocks.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({super.key});

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  ViaCepRepository cepRepository = ViaCepRepository();
  ViaCepModel? cep;
  bool isStarred = false;

  String? resultText = 'Busque um CEP';

  void toggleIsStarred() => setState(() {
        isStarred = !isStarred;
      });

  Future<void> handleSearchCep(String value) async {
    ViaCepModel? response = await cepRepository.searchCep(value);

    if (response == null) {
      setState(() {
        cep = null;
        resultText =
            'CEP não identificado no banco de dados, verifique os dados e tente novamente';
      });
    } else {
      setState(() {
        cep = response;
        resultText = null;
      });
    }
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
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isStarred
                          ? InkWell(
                              onTap: toggleIsStarred,
                              child: Icon(
                                Icons.star,
                                size: 35,
                                color: primary,
                              ),
                            )
                          : InkWell(
                              onTap: toggleIsStarred,
                              child: Icon(
                                Icons.star_border,
                                size: 35,
                                color: primary,
                              ),
                            ),
                      separator(width: 32),
                      Column(
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
                            cep!.logradouro!,
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
                      ),
                    ],
                  )
                : Text(
                    resultText!,
                    textAlign: TextAlign.center,
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
