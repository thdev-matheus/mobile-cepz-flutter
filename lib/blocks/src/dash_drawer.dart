import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cepz/styles/global_styles.dart';
import 'package:cepz/models/models.dart';
import 'package:cepz/components/components.dart';

class DashDrawer extends StatelessWidget {
  const DashDrawer({super.key, required this.children});

  final List<ItemDashDrawer> children;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: primary,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: secondary,
              child: Text(
                UserModel.username![0],
                style: GoogleFonts.comme(
                  fontSize: 35,
                ),
              ),
            ),
            accountName: Text(
              UserModel.username!,
              style: primaryTextStyle(
                color: white,
                weight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              UserModel.objectId!,
              style: primaryTextStyle(
                color: white,
                size: 12,
              ),
            ),
          ),
          ...children
        ],
      ),
    );
  }
}
