
import 'package:store_app/core/apis.dart';
import 'package:store_app/core/services/dio_service.dart';
import 'package:store_app/domain/models/product.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts();

  Future<ProductModel> getProduct(String id);
  Future<List<ProductModel>> getProductWithCategory(String category);
}

class ProductRepositoryImpl extends ProductRepository {
  final Network client;

  ProductRepositoryImpl({required this.client});

  @override
  Future<ProductModel> getProduct(String id) async {
    final json =
        await client.get(api: "${Apis.products}/$id") as Map<String, dynamic>;
    return ProductModel.fromJson(json);
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final json = await client.get(api: Apis.products) as List;
    return json
        .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<ProductModel>> getProductWithCategory(String category) async{
    final json = await client.get(api: "${Apis.productsCategory}$category") as List;
    return json
        .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
