import 'package:dummy_app/features/go-router_dio/model/product_model.dart';
import 'package:dummy_app/helpers/app_routes.dart';
import 'package:dummy_app/repository/item_repo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool loading = false;
  List<Product> products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //ElevatedButton(onPressed: () => context.push(AppRoutes.itemDetails), child: Text("Item Page")),
            ElevatedButton(onPressed: () => getItems(), child: Text("Get Items")),
            loading
                ? CircularProgressIndicator()
                : products.isEmpty
                    ? SizedBox()
                    : ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: products.length,
                        separatorBuilder: (c, i) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ListTile(
                            leading: Image.network(product.image ?? '', width: 100, height: 100),
                            title: Text(product.title ?? '', maxLines: 1),
                            subtitle: Text(product.price.toString() ?? ''),
                            onTap: () {
                              // context.push == Navigator.push
                              // context.go == Navigator.pushReplacement
                              //context.push(AppRoutes.itemDetails, extra: product,pathParams:);
                              // context.push(AppRoutes.itemDetails.replaceFirst(':id', product.id.toString()),
                              //     extra: product);

                              context.pushNamed(AppRoutes.itemDetails,
                                  pathParameters: {'id': '${product.id}'}, extra: product);
                            },
                          );
                        },
                      ),
          ],
        ),
      ),
    );
  }

  void getItems() async {
    try {
      loading = true;
      setState(() {});
      products = await ItemRepository().getItems();
    } finally {
      loading = false;
      setState(() {});
    }
  }
}
