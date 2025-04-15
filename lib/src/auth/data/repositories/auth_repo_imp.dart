  import 'package:injectable/injectable.dart';
import 'package:app/src/auth/data/models/login_params.dart';

import '../../../../core/utils/helper_methods.dart';
 import '../../domain/repositories/auth_repo.dart';
import '../data_sources/auth_datasource.dart';
import '../models/profile_dto.dart';

@Injectable(as: AuthRepo)
class AuthRepoImp extends AuthRepo {
  final AuthDataSource apiProvider;
  AuthRepoImp(this.apiProvider);

  @override
  Future<ProfileDto> login(LoginParams params) async {
    final response = await apiProvider.login(params);
    await HelperMethods.saveToken(response.token ?? "");
    return  response;
  }
}
