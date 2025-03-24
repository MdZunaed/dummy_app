import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Page"),
      ),
      body: Column(
        children: [Text("Item Page")],
      ),
    );
  }
}
