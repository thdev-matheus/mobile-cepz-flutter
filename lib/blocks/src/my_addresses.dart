import 'package:flutter/material.dart';

import 'package:cepz/models/models.dart';

class MyAddresses extends StatefulWidget {
  const MyAddresses({
    super.key,
  });

  @override
  State<MyAddresses> createState() => _MyAddressesState();
}

class _MyAddressesState extends State<MyAddresses> {
  var list = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) => Card(
        child: Text("item $index"),
      ),
    );
  }
}
