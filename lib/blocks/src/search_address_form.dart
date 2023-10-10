import 'package:flutter/material.dart';
import 'package:cepz/components/components.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SearchAddressForm extends StatefulWidget {
  const SearchAddressForm({
    super.key,
    required this.onAction,
  });

  final Future<void> Function(String value) onAction;

  @override
  State<SearchAddressForm> createState() => _SearchAddressFormState();
}

class _SearchAddressFormState extends State<SearchAddressForm> {
  final MaskTextInputFormatter cepMask = MaskTextInputFormatter(
    mask: '##.###-###',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  void handleSearchCep() async {
    if (!cepMask.isFill()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Preencha os dados direito',
          ),
        ),
      );

      return;
    }

    await widget.onAction(cepMask.getUnmaskedText());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextInput(
          masks: [cepMask],
          keyType: TextInputType.number,
          placeholder: 'Digite aqui o seu CEP do endereço',
        ),
        separator(height: 16),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 48,
                child: TXTButton(
                  textSize: 22,
                  text: 'Buscar CEP',
                  action: handleSearchCep,
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
