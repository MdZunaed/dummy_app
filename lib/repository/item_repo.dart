import 'package:dio/dio.dart';
import 'package:dummy_app/models/product_model.dart';

class ItemRepository {
  Dio dio = Dio();
  Future<List<Product>> getItems() async {
    List<Product> products = [];
    final Response response = await dio.get("https://fakestoreapi.com/products");
    print("Status Code ======> ${response.statusCode}");
    print("Items Data ======> ${response.data}");
    if (response.statusCode == 200) {
      products = (response.data as List).map((item) => Product.fromJson(item)).toList();
    }
    return products;
  }
}
