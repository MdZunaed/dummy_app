import 'package:dummy_app/helpers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              title: const Text("Products"),
              onTap: () => context.push(AppRoutes.products),
            ),
            ListTile(
              title: const Text("Districts"),
              onTap: () => context.push(AppRoutes.districts),
            ),
            ListTile(
              title: const Text("Indexed Stack"),
              onTap: () => context.push(AppRoutes.indexedStack),
            ),
            ListTile(
              title: const Text("App Lifecycle Observer"),
              onTap: () => context.push(AppRoutes.lifecycleObserver),
            ),
            ListTile(
              title: const Text("Inherited Widget"),
              onTap: () => context.push(AppRoutes.inheritedWidget),
            ),
            ListTile(
              title: const Text("Websocket Demo"),
              onTap: () => context.push(AppRoutes.websocketDemo),
            ),
          ],
        ),
      ),
    );
  }
}
