import 'package:flutter/material.dart';

import 'package:cepz/pages/_pages.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  '/': (context) => const LoginPage(),
  '/login': (context) => const LoginPage(),
};
