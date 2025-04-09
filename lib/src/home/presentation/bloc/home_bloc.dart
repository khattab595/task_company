import 'package:app/src/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';

@Injectable()
class HomeCubit extends BaseCubit {
  final HomeRepo repo;

  HomeCubit(this.repo);

  fetchHomeData() async {
    executeSuccess(() => repo.fetchProducts());
  }
}
