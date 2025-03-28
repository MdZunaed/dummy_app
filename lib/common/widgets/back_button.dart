import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back));
  }
}
