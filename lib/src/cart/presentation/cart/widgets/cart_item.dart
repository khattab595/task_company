import 'package:app/src/product/data/models/product_dto.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../product/presentation/widgets/public_item.dart';
import '../../../../main_index.dart';

class CartItem extends BaseStatelessWidget {
  final ProductDto data;
  final Function() onRefresh;

  CartItem({
    Key? key,
    required this.data,
    required this.onRefresh,
  }) : super(key: key);

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return PublicItem(onPressed: onPressed,icon: Icons.delete, data: data,);
  }


  onPressed() async {
    HelperMethods.removeProductFromList(data.id)
        .then((value) => onRefresh());
  }
}
