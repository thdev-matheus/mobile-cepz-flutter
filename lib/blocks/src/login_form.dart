import 'package:cepz/components/components.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const TextInput(
            placeholder: 'Digite seu usuário',
            icon: Icons.person,
            label: 'Usuário',
            isRequired: true,
          ),
          separator(height: 16),
          const TextInput(
            placeholder: 'Digite sua senha',
            icon: Icons.lock,
            label: 'Senha',
            isPassword: true,
            isRequired: true,
          ),
          separator(height: 16),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 64,
                  child: TXTButton(
                    text: 'Entrar',
                    textSize: 24,
                    action: () {},
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
