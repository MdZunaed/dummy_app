import 'package:dummy_app/helpers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("HomePage"),
            ElevatedButton(onPressed: () => context.go(AppRoutes.itemDetails), child: Text("Item Page")),
          ],
        ),
      ),
    );
  }
}
