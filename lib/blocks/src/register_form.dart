// ignore_for_file: use_build_context_synchronously

import 'package:cepz/repositories/repositories.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:cepz/components/components.dart';
import 'package:cepz/utils/utils.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  UserRepository userRepository = UserRepository();
  TextEditingController userNameInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  TextEditingController confirmPasswordInputController =
      TextEditingController();

  String? userNameError;
  String? passwordError;
  String? confirmPasswordError;

  void onMessageAction(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
        ),
      );

  Future<void> handleSubmit() async {
    //verificação do nome de usuário
    Map<String, dynamic> userNameValidation =
        Validator.userNameValidation(userNameInputController.text);

    if (!userNameValidation['result']) {
      setState(() {
        userNameError = userNameValidation['message'];
      });
    } else {
      setState(() {
        userNameError = null;
      });
    }

    //verificação de senha
    Map<String, dynamic> passwordValidation =
        Validator.passwordValidation(passwordInputController.text);

    if (!passwordValidation['result']) {
      setState(() {
        passwordError = passwordValidation['message'];
      });
    } else {
      setState(() {
        passwordError = null;
      });
    }

    //verificação de consfirmação de senha
    Map<String, dynamic> confirmPasswordValidation =
        Validator.passwordValidation(confirmPasswordInputController.text);

    if (!confirmPasswordValidation['result']) {
      setState(() {
        confirmPasswordError = confirmPasswordValidation['message'];
      });
    } else if (confirmPasswordInputController.text !=
        passwordInputController.text) {
      setState(() {
        passwordError = 'Senhas não são iguais';
      });
    } else {
      setState(() {
        passwordError = null;
      });
    }

    //validação geral de retorno
    if (!userNameValidation['result'] ||
        !passwordValidation['result'] ||
        !confirmPasswordValidation['result'] ||
        confirmPasswordInputController.text != passwordInputController.text) {
      return;
    }

    try {
      await userRepository.register(
        username: userNameInputController.text,
        password: passwordInputController.text,
      );

      onMessageAction('Cadastro efetuado com sucesso');

      navigator(context: context, to: '/login', remove: true);
    } on DioException catch (e) {
      if (e.response!.data['error'] ==
          'Account already exists for this username.') {
        onMessageAction(
            'Este nome de usuário já existe em nosso banco de dados.');
      } else {
        onMessageAction('Algo deu errado. Tente novamente mais tarde');
      }
    } catch (_) {
      onMessageAction('Algo deu errado. Tente novamente mais tarde');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextInput(
          borderRadius: 8,
          error: userNameError,
          controller: userNameInputController,
          placeholder: 'Digite seu nome de usuário',
          icon: Icons.person,
          label: 'Usuário',
          isRequired: true,
        ),
        separator(height: 16),
        TextInput(
          borderRadius: 8,
          error: passwordError,
          controller: passwordInputController,
          placeholder: 'Digite uma senha forte',
          icon: Icons.lock,
          label: 'Senha',
          isPassword: true,
          isRequired: true,
        ),
        separator(height: 16),
        TextInput(
          borderRadius: 8,
          error: confirmPasswordError,
          controller: confirmPasswordInputController,
          placeholder: 'Confirme a senha',
          icon: Icons.lock,
          label: 'Confirmação',
          isPassword: true,
          isRequired: true,
        ),
        separator(height: 16),
        SizedBox(
          height: 55,
          width: MediaQuery.of(context).size.width,
          child: TXTButton(
            text: 'Cadastrar',
            textSize: 24,
            action: handleSubmit,
          ),
        ),
      ],
    );
  }
}
