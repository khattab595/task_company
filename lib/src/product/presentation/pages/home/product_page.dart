import 'package:app/src/product/data/models/product_dto.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';
import '../../bloc/home_bloc.dart';
import 'product_screen.dart';

class ProductPage
    extends BaseBlocWidget<DataSuccess<List<ProductDto>>, HomeCubit> {
  ProductPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.product),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.cartPage);
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ),
      ),
      body: buildConsumer(context),
    );
  }

  @override
  Widget buildWidget(
      BuildContext context, DataSuccess<List<ProductDto>> state) {
    return HomeScreen(
      home: state.data!,
    );
  }
}
