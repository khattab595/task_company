
import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repo.dart';
import '../data_sources/auth_datasource.dart';

@Injectable(as: AuthRepo)
class AuthRepoImp extends AuthRepo {
  final AuthDataSource apiProvider;
  AuthRepoImp(this.apiProvider);

  // @override
  // Future<Profile> login(LoginParams params) async {
  //   final response = await apiProvider.login(params);
  //   await HelperMethods.saveToken(response.token ?? "");
  //   return Profile.fromJson(response);
  // }
}
