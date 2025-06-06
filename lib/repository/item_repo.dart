import 'package:dio/dio.dart';
import 'package:dummy_app/common/constants/urls.dart';
import 'package:dummy_app/features/go-router_dio/model/product_model.dart';

class ItemRepository {
  Dio dio = Dio();
  Future<List<Product>> getItems() async {
    List<Product> products = [];
    final Response response = await dio.get(Urls.products);
    print("Status Code ======> ${response.statusCode}");
    print("Items Data ======> ${response.data}");
    if (response.statusCode == 200) {
      products = (response.data as List).map((item) => Product.fromJson(item)).toList();
    }
    return products;
  }
}
