import '../../../../../core/widgets/texts/texts.dart';
import '../../../../product/data/models/product_dto.dart';
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
              : GridView.builder(
      padding: 8.paddingHoriz,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 0.69,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return CartItem( data: data[index],
          onRefresh: onRefresh,);
      },
    ),


        ),
        Container(
                    padding: 20.paddingHoriz,
          height: 60,
          child: Row(
            children: [

              Expanded(
                child: RegularHintText(
                    label: totalPrice(data).toString(),  ),
              ),
              RegularText(
                  label: strings.total,

                  fontSize: 20),
            ],
          ),
        )
      ],
    );
  }
}
