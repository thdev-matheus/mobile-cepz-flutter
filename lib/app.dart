import 'package:cepz/routes.dart';
import 'package:flutter/material.dart';

class Cepz extends StatelessWidget {
  const Cepz({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        initialRoute: '/',
        title: 'Cepz',
      ),
    );
  }
}
