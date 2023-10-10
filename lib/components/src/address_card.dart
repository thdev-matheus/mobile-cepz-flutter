import 'package:cepz/styles/global_styles.dart';
import 'package:flutter/material.dart';
import 'package:cepz/models/models.dart';

class AddressCard extends StatefulWidget {
  const AddressCard({super.key, required this.cep});

  final CepModel cep;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  double offsetX = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          offsetX += details.delta.dx;
        });
      },
      onHorizontalDragEnd: (_) {
        if (offsetX <= -275) {
          // lógica para deletar
        }
        setState(() {
          offsetX = 0;
        });
      },
      child: Transform.translate(
        offset: Offset(offsetX, 0),
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CEP: ${widget.cep.cep}',
                    style: primaryTextStyle(
                      size: 18,
                      weight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.cep.logradouro,
                    style: primaryTextStyle(
                      size: 16,
                    ),
                  ),
                  Text(
                    'Complemento: ${widget.cep.complemento != '' ? widget.cep.complemento : 'N/A'}',
                    style: primaryTextStyle(size: 14),
                  ),
                  Text(
                    'Local: ${widget.cep.bairro} - ${widget.cep.localidade}/${widget.cep.uf}',
                    style: primaryTextStyle(size: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
