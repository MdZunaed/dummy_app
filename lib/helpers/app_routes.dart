import 'package:dummy_app/common/widgets/error_page.dart';
import 'package:dummy_app/features/go-router_dio/model/product_model.dart';
import 'package:dummy_app/features/go-router_dio/screens/product_details.dart';
import 'package:dummy_app/features/go-router_dio/screens/product_list.dart';
import 'package:dummy_app/features/home/screen/home_screen.dart';
import 'package:dummy_app/features/pencilbox_districts/view/districts_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String initial = '/';
  static const String products = '/products';
  static const String itemDetails = '/item-details';
  static const String districts = '/districts';
  static const String error = '/error';
  static GoRouter routes = GoRouter(
    initialLocation: initial,
    routerNeglect: false,
    errorBuilder: (c, s) => const ErrorPage(),
    routes: [
      // Use pageBuilder + MaterialPage when need custom transition and better deep linking
      GoRoute(path: initial, builder: (context, state) => const HomeScreen()),
      GoRoute(path: products, builder: (context, state) => const ProductList()),
      GoRoute(
          name: itemDetails,
          path: '/item-details/:id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '';
            final product = state.extra as Product;
            return ProductDetails(id: id, product: product);
          }),
      GoRoute(path: districts, builder: (context, state) => const DistrictsView()),
      GoRoute(path: error, builder: (context, state) => const ErrorPage()),
    ],
  );
}
