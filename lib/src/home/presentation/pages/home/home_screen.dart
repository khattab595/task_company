import 'package:app/src/home/presentation/widgets/item_product.dart';

import '../../../../../core/widgets/texts/texts.dart';
import '../../../../main_index.dart';
import '../../../data/models/product_dto.dart';

class HomeScreen extends BaseStatelessWidget {
  final List<ProductDto> home;

  HomeScreen({Key? key, required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (home.isEmpty)
        ? Center(child: MediumText(label: strings.empty_list,fontSize: 14,))
        : ListView.builder(
            itemCount: home.length,
            itemBuilder: (context, index) {
              return ItemProduct(data: home[index]);
            });
  }
}
