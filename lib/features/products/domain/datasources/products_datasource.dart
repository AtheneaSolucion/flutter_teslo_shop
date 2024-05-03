import '../entities/product.dart';

abstract class ProductsDataSource {
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0});
  Future<Product> getProductsById(String id);

  Future<List<Product>> searchProductsByTerm(String term);

  Future<Product> createUpdateProduct(Map<String, dynamic> productLike);
}
