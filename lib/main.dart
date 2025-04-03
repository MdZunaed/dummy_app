import 'package:dummy_app/features/pencilbox_districts/view_model/district_view_model.dart';
import 'package:dummy_app/helpers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DistrictViewModel()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Dummy App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        routerConfig: AppRoutes.routes,
        //home: const HomePage(),
      ),
    );
  }
}
