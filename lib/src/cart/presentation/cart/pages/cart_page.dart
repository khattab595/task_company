
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../home/data/models/product_dto.dart';
import '../../../../main_index.dart';
import '../cubit/cart_bloc.dart';
import 'cart_screen.dart';

class CartPage
    extends BaseBlocWidget<DataSuccess<List<ProductDto>>, CartCubit> {
  CartPage({Key? key}) : super(key: key);

@override
  void loadInitialData(BuildContext context) {
    bloc.fetchCartData();
  }



  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<ProductDto>> state) {
 
    return CartScreen(data:state.data??[],
    
    onRefresh: () => loadInitialData(context),
    )  ;
    
  }

  @override
  String? title(BuildContext context) {
    return strings.cart;
  }


}
