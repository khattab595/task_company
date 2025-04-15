
import '../../data/models/product_dto.dart';

abstract class HomeRepo {
  Future<List<ProductDto>> fetchProducts();
 }
