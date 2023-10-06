import 'package:flutter/material.dart';

import 'package:cepz/components/components.dart';
import 'package:cepz/blocks/blocks.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Logo(),
                separator(height: 50),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
