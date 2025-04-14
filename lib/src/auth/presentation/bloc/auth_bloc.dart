import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../data/models/login_params.dart';
 import '../../domain/repositories/auth_repo.dart';

@Injectable()
class AuthCubit extends BaseCubit {
  final AuthRepo repo;

  AuthCubit(this.repo);

 // void login(LoginParams params) async {
 //   executeSuccessState(() => repo.login(params));
 //  }


}
