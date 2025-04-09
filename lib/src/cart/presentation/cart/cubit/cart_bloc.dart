import 'package:app/core/utils/helper_methods.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';

@Injectable()
class CartCubit extends BaseCubit {
  fetchCartData()   {
    executeSuccess(() async {
      return HelperMethods.getProductList();
    });
  }
}
