import 'package:flutter/material.dart';

import 'package:cepz/pages/pages.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  '/': (context) => const LoginPage(),
  '/login': (context) => const LoginPage(),
  '/register': (context) => const RegisterPage(),
  '/dashboard': (context) => const DashboardPage(),
};
