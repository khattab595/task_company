import '../../../../../core/widgets/texts/texts.dart';
import '../../../../home/data/models/product_dto.dart';
import '../../../../main_index.dart';
import '../widgets/cart_item.dart';

class CartScreen extends BaseStatelessWidget {
  final List<ProductDto> data;
  final Function() onRefresh;

  CartScreen({Key? key, required this.onRefresh, required this.data})
      : super(key: key);

  double totalPrice(List<ProductDto> products) {
    return products.fold(0.0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: (data.isEmpty)
              ? Center(child: MediumText(label: strings.empty_list,fontSize: 14,))
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => CartItem(
                    data: data[index],
                    onRefresh: onRefresh,
                  ),
                ),
        ),
        Container(
          decoration:
              Decorations.baseDecorationRadius(color: Colors.red, radius: 0),
          padding: 20.paddingHoriz,
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: RegularText(
                    label: strings.total,
                    labelColor: Colors.white,
                    fontSize: 20),
              ),
              RegularHintText(
                  label: totalPrice(data).toString(), labelColor: Colors.white),
            ],
          ),
        )
      ],
    );
  }
}
