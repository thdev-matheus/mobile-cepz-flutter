import 'package:cepz/components/components.dart';
import 'package:cepz/styles/global_styles.dart';
import 'package:flutter/material.dart';

class RemoveAddressModal extends StatefulWidget {
  const RemoveAddressModal({
    super.key,
    required this.actionRemove,
  });

  final Future<void> Function() actionRemove;

  @override
  State<RemoveAddressModal> createState() => _RemoveAddressModalState();
}

class _RemoveAddressModalState extends State<RemoveAddressModal> {
  bool isLoading = false;

  void toggleIsLoading() => setState(() {
        isLoading = !isLoading;
      });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(bottom: 16, right: 32),
      title: Center(
        child: Text(
          'Apagar Endereço',
          style: primaryTextStyle(
            color: primary,
            size: 25,
            weight: FontWeight.bold,
          ),
        ),
      ),
      content: Text(
        'Você está prestes a apagar este Endereço. Deseja continuar?',
        style: primaryTextStyle(
          size: 18,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'não',
            style: primaryTextStyle(
              size: 20,
              weight: FontWeight.bold,
            ),
          ),
        ),
        separator(width: 8),
        isLoading
            ? const CircularProgressIndicator()
            : InkWell(
                onTap: () async {
                  setState(() {
                    toggleIsLoading();
                  });
                  await widget.actionRemove();
                  setState(() {
                    toggleIsLoading();
                  });
                },
                child: Text(
                  'sim',
                  style: primaryTextStyle(
                    color: Colors.red,
                    size: 20,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
      ],
    );
  }
}
