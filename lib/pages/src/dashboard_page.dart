import 'package:cepz/components/components.dart';
import 'package:cepz/models/models.dart';
import 'package:cepz/styles/global_styles.dart';
import 'package:flutter/material.dart';
import 'package:cepz/blocks/blocks.dart';

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
            ItemDashDrawer(
              icon: Icons.cell_tower,
              title: 'Outro item',
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
