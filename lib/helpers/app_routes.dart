import 'package:dummy_app/models/product_model.dart';
import 'package:dummy_app/screens/error_page.dart';
import 'package:dummy_app/screens/home_page.dart';
import 'package:dummy_app/screens/product_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String initial = '/';
  static const String itemDetails = '/item-details';
  static const String error = '/error';
  static GoRouter routes = GoRouter(
    initialLocation: initial,
    routerNeglect: false,
    errorBuilder: (c, s) => const ErrorPage(),
    routes: [
      // Use pageBuilder + MaterialPage when need custom transition and better deep linking
      GoRoute(path: initial, builder: (context, state) => const HomePage()),
      GoRoute(
          name: itemDetails,
          path: '/item-details/:id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '';
            final product = state.extra as Product;
            return ProductPage(id: id, product: product);
          }),
      GoRoute(path: error, builder: (context, state) => const ErrorPage()),
    ],
  );
}
