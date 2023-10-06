import 'package:cepz/styles/global_styles.dart';
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
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Logo(),
                separator(height: 50),
                Text(
                  'Login',
                  style: primaryTextStyle(size: 36, weight: FontWeight.bold),
                ),
                separator(height: 24),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
