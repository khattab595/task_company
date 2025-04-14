import 'package:app/src/home/data/models/product_dto.dart';
import 'package:app/src/home/presentation/widgets/public_item.dart';
import '../../../../core/utils/helper_methods.dart';
import '../../../main_index.dart';

class ItemProduct extends BaseStatelessWidget {
  final ProductDto data;

  ItemProduct({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return PublicItem(onPressed: onPressed,icon: Icons.shopping_cart, data: data,);
  }

  onPressed() async {
    List<ProductDto>? productList = HelperMethods.getProductList();
    print(productList.length);
    print("product");
    if (productList.contains(data)) {
      HelperMethods.showErrorToast(strings.this_product_is_in_the_cart);
    } else {
      HelperMethods.addProductToList(data).then(
        (value) => HelperMethods.showErrorToast(strings.added_cart),
      );
    }
  }
}
