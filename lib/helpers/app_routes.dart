import 'package:dummy_app/screens/home_page.dart';
import 'package:dummy_app/screens/item_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String initial = '/';
  static const String itemDetails = '/item-details';
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: initial, builder: (context, state) => const HomePage()),
      GoRoute(path: itemDetails, builder: (context, state) => const ItemDetails()),
    ],
  );
}
