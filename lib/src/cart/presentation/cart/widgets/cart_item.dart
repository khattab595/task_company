import 'package:app/src/home/data/models/product_dto.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../main_index.dart';
import '../../../../shared/shared_item.dart';

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
    return SharedItem(onPressed: onPressed,icon: Icons.remove, data: data,);
  }


  onPressed() async {
    HelperMethods.removeProductFromList(data.id)
        .then((value) => onRefresh());
  }
}
