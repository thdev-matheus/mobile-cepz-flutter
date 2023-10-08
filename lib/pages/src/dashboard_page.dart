import 'package:flutter/material.dart';

import 'package:cepz/components/components.dart';
import 'package:cepz/blocks/blocks.dart';
import 'package:cepz/models/models.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DashDrawer(
          children: [
            ItemDashDrawer(
              icon: Icons.cell_tower,
              title: 'Meus ceps',
              onAction: () {},
            ),
          ],
        ),
        appBar: AppBar(
          title: Text(UserModel.username!),
        ),
      ),
    );
  }
}
