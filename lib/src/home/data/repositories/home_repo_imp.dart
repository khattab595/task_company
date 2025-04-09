import 'package:app/src/home/data/models/product_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/helper_methods.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_sources/home_datasource.dart';
import 'dart:convert';

@Injectable(as: HomeRepo)
class HomeRepoImp extends HomeRepo {
  final HomeDatasource datasource;
  HomeRepoImp(this.datasource);

  @override
  Future<List<ProductDto>> fetchProducts() async {

      final response = await datasource.fetchProduct();

    return response;
  }

  List<ProductDto> productsFromJson(List<dynamic> json) {
    return List<ProductDto>.from(json.map((x) => ProductDto.fromJson(x)));
  }




  List<ProductDto> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<ProductDto>((json) => ProductDto.fromJson(json)).toList();
  }
}
