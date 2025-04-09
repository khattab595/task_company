import 'package:app/src/home/presentation/widgets/item_product.dart';

import '../../../../main_index.dart';
import '../../../data/models/product_dto.dart';

class HomeScreen extends BaseStatelessWidget {
  final List<ProductDto> home;

  HomeScreen({Key? key, required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: home.length,
      itemBuilder: (context, index) => ItemProduct(data: home[index]),
    );
  }
}
