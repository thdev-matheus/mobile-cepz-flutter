import 'package:cepz/styles/global_styles.dart';
import 'package:flutter/material.dart';

class ItemDashDrawer extends StatelessWidget {
  const ItemDashDrawer({
    super.key,
    required this.icon,
    required this.title,
    required this.onAction,
  });

  final IconData icon;
  final String title;
  final void Function() onAction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: primary,
        size: 25,
      ),
      title: Text(
        title,
        style: primaryTextStyle(
          weight: FontWeight.bold,
          size: 18,
          color: primary,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: primary,
        size: 20,
      ),
      onTap: onAction,
    );
  }
}
