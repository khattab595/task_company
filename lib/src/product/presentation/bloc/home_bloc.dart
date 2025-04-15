import 'package:app/src/product/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';

@Injectable()
class HomeCubit extends BaseCubit {
  final HomeRepo repo;

  HomeCubit(this.repo);

  fetchProduct() async {
    executeSuccess(() => repo.fetchProducts());
  }
}
