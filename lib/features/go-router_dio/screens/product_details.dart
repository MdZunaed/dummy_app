import 'package:dummy_app/features/go-router_dio/model/product_model.dart';
import 'package:dummy_app/helpers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  final String id;
  const ProductDetails({super.key, required this.product, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product ID: $id"),
        actions: [
          IconButton(onPressed: () => context.push(AppRoutes.error), icon: Icon(Icons.error_outline))
        ],
      ),
      body: Column(
        children: [
          Image.network(product.image ?? "", height: 200, width: double.infinity),
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(product.title ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
