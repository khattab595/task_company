import 'package:app/src/home/data/models/product_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@Injectable( )
class HomeDatasource {
  final Dio dio = Dio();

  Future<List<ProductDto>> fetchProduct() async {
    List<ProductDto> model=[];
    await dio
        .get(
      "https://fakestoreapi.com/products",
    )
        .then(
      (value) {
         model = productsFromJson(value.data);
        return value;
      },
    );
    return model;
  }
  List<ProductDto> productsFromJson(List<dynamic> json) {
    return List<ProductDto>.from(json.map((x) => ProductDto.fromJson(x)));
  }
}
