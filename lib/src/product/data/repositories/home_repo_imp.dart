import 'package:app/src/product/data/models/product_dto.dart';
import 'package:injectable/injectable.dart';

 import '../../domain/repositories/home_repo.dart';
import '../data_sources/home_datasource.dart';

@Injectable(as: HomeRepo)
class HomeRepoImp extends HomeRepo {
  final ProductDatasource datasource;
  HomeRepoImp(this.datasource);

  @override
  Future<List<ProductDto>> fetchProducts() async {

      final response = await datasource.fetchProduct();

    return response;
  }

  List<ProductDto> productsFromJson(List<dynamic> json) {
    return List<ProductDto>.from(json.map((x) => ProductDto.fromJson(x)));
  }


}
